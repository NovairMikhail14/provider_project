import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider_project/moviesapp/model/moviedata.dart';

final List<Movie> initData = List.generate(10,(index) => Movie(title: "Movie $index",runtime:"${Random().nextInt(100)+60} mi",like: false,color: Colors.white ),);

class MovieProvider extends ChangeNotifier{
  List<Movie> _AllList =initData ;
  List<Movie> _MyList = [];

  List<Movie> get AllList{return _AllList;}
  List<Movie> get Mylist{return _MyList;}


  AddMyList({required String title,required String runtime ,required int index }){
    Movie select = Movie(title:title,runtime: runtime,like: false ,color:Colors.white);
    _AllList[index].color = Colors.red;
    _AllList[index].like = true;
    _MyList.add(select);
    notifyListeners();
  }
  removeAlllist({required int index }){
    Movie select = _AllList[index];
    _AllList[index].like = false;
    _AllList[index].color = Colors.white;
    _MyList.removeWhere((element) => element.title == select.title ,);
    print(select.title);
    notifyListeners();
  }

  removemylist({required Movie select }){
    _AllList.firstWhere((element) => element.title == select.title ).color = Colors.white;
    _MyList.removeWhere((element) => element.title == select.title ,);
    notifyListeners();
  }

}