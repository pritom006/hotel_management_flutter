import 'package:flutter/cupertino.dart';
import 'package:hotel_app/data/signup.dart';

class UserProvider with ChangeNotifier {
  final List<SignUp> _users = [];
  List<SignUp> get users {
    return [..._users];
  }

  void addUser(SignUp sign) {
    final adduser = SignUp(
      userName: sign.userName,
      age: sign.age,
      password: sign.password,
      userEmail: sign.userEmail,
    );
    _users.add(adduser);
    notifyListeners();
  }
}
