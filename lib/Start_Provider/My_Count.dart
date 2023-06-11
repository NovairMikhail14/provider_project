import 'package:flutter/material.dart';

class MyCount extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  set count(int value) {
    _count = value;
  }
  void incCounter(){
    _count++;
    notifyListeners();
  }
  void decCounter(){
    _count--;
    notifyListeners();
  }
}
