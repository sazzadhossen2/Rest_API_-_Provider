import 'package:flutter/cupertino.dart';

class Fovider with ChangeNotifier{
  List<int> _favorite=[];
  List<int> get favorite =>_favorite;

  void setState(int value){
    _favorite.add(value);
    notifyListeners();
  }


  void remove(int value){
    _favorite.remove(value);
    notifyListeners();
  }
}