import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ThemeStatus extends ChangeNotifier {
  bool _darkThemeEnabled = true;

  bool get darkThemeEnabled => _darkThemeEnabled;
  String stringToRead;

  Future<void> changeTheme() async {
    _darkThemeEnabled = !_darkThemeEnabled;
    notifyListeners();
  }

  void modifyStringToRead(value) {
    stringToRead = value;
  }

  void increaseTextSize() {
    textSize++;
    notifyListeners();
  }

  void decreaseTextSize() {
    textSize--;
    notifyListeners();
  }

  double textSize = 1.0;
}
