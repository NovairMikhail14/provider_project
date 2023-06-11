import 'package:flutter/material.dart';

class SiginInProvider extends ChangeNotifier{
  String _usrname="";
  DateTime? _sigintime;

  String get Username => _usrname;
  DateTime? get Datesign => _sigintime;
  
  SiginIn(String value){
 _usrname = value;
     notifyListeners();
  }
    SetTime(){
 _sigintime = DateTime.now()??DateTime.utc(1991);
     notifyListeners();
  }



  

}