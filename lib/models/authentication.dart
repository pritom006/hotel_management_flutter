import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Authentication with ChangeNotifier {
  String? _token;
  DateTime? _expiresIn;
  String? _userId;
  Timer? _authTimer;
  get userId => _userId;
  Future<void> signUp(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCCrLw9fYF-47TTXGoTRiR68HWDeIOOyNI';

    final response = await http.post(
      Uri.parse(url),
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    print(json.decode(response.body));
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCCrLw9fYF-47TTXGoTRiR68HWDeIOOyNI';

    final response = await http.post(Uri.parse(url),
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    final responseData = json.decode(response.body);
    _token = responseData['idToken'];
    _expiresIn = DateTime.now().add(
      Duration(seconds: int.parse(responseData['expiresIn'])),
    );
    _userId = responseData['localId'];

    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode({
      'token': _token,
      'userId': _userId,
      'expiryDate': _expiresIn!.toIso8601String()
    });
    prefs.setString('userData', userData);

    userCollection(email);
    notifyListeners();
  }

  get token {
    if (_expiresIn != null &&
        _expiresIn!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
  }

  bool get isAuth {
    return token != null;
  }

  Future<bool?> autoLogin() async {
    final pref = await SharedPreferences.getInstance();
    if (!pref.containsKey('userData')) {
      return false;
    }
    final stringData = pref.getString('userData');
    final extractedUserData = json.decode(stringData!) as Map<String, Object>;

    final expiryDate =
        DateTime.parse(extractedUserData['expiryDate'].toString());

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _expiresIn = expiryDate;
    _token = extractedUserData['token'].toString();
    _userId = extractedUserData['userId'].toString();

    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiresIn = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }

    final pref = await SharedPreferences.getInstance();
    pref.clear();
    print(_token);
    print(_userId);
    notifyListeners();
  }

  Future<void> userCollection(String email) async {
    const url =
        'https://firestore.googleapis.com/v1/projects/hotel-app-bd91c/databases/(default)/documents/users';

    final responseUser = await http.get(Uri.parse(url));
    final responseUserData =
        json.decode(responseUser.body) as Map<String, dynamic>;
    final _userList = [];
    for (var item in responseUserData['documents']) {
      _userList.add(item['fields']);
    }

    final datas = _userList
        .where((element) => element['userId']['stringValue'] == _userId);
    if (datas.isNotEmpty) {
      print('add');
      print(_userId);
    } else {
      await http.post(
        Uri.parse(url),
        body: json.encode({
          'fields': {
            'userId': {
              "stringValue": _userId,
            },
            'userName': {
              "stringValue": '',
            },
            'phone': {
              "stringValue": '',
            },
            'blood': {
              "stringValue": '',
            },
            'gender': {
              "stringValue": '',
            },
            'nidId': {
              "stringValue": '',
            },
            'localAddress': {
              "stringValue": '',
            },
            'presentAddress': {
              "stringValue": '',
            },
            'email': {
              "stringValue": email,
            },
          }
        }),
      );
    }
    notifyListeners();
  }

  Iterable<dynamic> _user = [];
  Future<void> userDetails() async {
    const url =
        'https://firestore.googleapis.com/v1/projects/hotel-app-bd91c/databases/(default)/documents/users';
    final response = await http.get(Uri.parse(url));
    final responseData = jsonDecode(response.body);

    final _userList = [];
    for (var item in responseData['documents']) {
      _userList.add(item['fields']);
    }
    _user = _userList
        .where((element) => element['userId']['stringValue'] == _userId);
  }

  Iterable<dynamic> get user => _user;
}
