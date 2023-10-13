
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themeprovider with ChangeNotifier{
  var _themedata =ThemeMode.light;
  ThemeMode get themedata => _themedata;

  void setTheme(themedata){
    _themedata = themedata;
    notifyListeners();

  }

}