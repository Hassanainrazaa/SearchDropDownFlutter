import 'package:flutter/cupertino.dart';

class Toggle extends ChangeNotifier {
  bool checkSearch = true;

  void toggleSearch() {
    checkSearch = !checkSearch;
    notifyListeners();
  }
}
