import 'package:flutter/foundation.dart';

class ButtonProvider with ChangeNotifier {
  int _member = 1;
  get member => _member;
  set remove(int memberData) {
    _member -= memberData;
    notifyListeners();
  }

  set add(int memberData) {
    _member += memberData;
    notifyListeners();
  }
}
