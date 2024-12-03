import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  bool languagechenge = false;
  void changelanguage() {
    languagechenge = !languagechenge;
    bool value = languagechenge;
    notifyListeners();
  }
}
