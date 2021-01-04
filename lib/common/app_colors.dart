import 'package:flutter/material.dart';

class AppColor{
  AppColor._();

  static const Color ff5E3ABF = Color(0xFF5E3ABF);
  static const Color ff0BA5A5 = Color(0xFF0BA5A5);
  static const Color ff41ADEB = Color(0xFF41ADEB);


  static Map<int, Color> color =
  {
    50:Color.fromRGBO(136,14,79, .1),
    100:Color.fromRGBO(136,14,79, .2),
    200:Color.fromRGBO(136,14,79, .3),
    300:Color.fromRGBO(136,14,79, .4),
    400:Color.fromRGBO(136,14,79, .5),
    500:Color.fromRGBO(136,14,79, .6),
    600:Color.fromRGBO(136,14,79, .7),
    700:Color.fromRGBO(136,14,79, .8),
    800:Color.fromRGBO(136,14,79, .9),
    900:Color.fromRGBO(136,14,79, 1),
  };

  static MaterialColor colorCustom = MaterialColor(0xFF2a2e43, color);


}