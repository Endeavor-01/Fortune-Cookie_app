
import 'dart:math';

import 'package:flutter/cupertino.dart';

class FortuneModel with ChangeNotifier{

  String _currentFortune = "";

  final _fortuneList = [
    "tommorow good day ",
    "next year death",
    "richie rich rich",
    "be good b e kind",
    "Start hello world from tomorrow to increase your knowledge"
  ];

  String get fortune => _currentFortune;

  // FortuneModel(){
  //   _getRandomCookie();
  // }

  void   _getRandomCookie() {
    var random = Random();
    int randNum = random.nextInt(_fortuneList.length);
    _currentFortune = _fortuneList[randNum];
    notifyListeners();
  }
  void getNewFortune(){
    _getRandomCookie();
  }
}