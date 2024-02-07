//style use to mange style in project
//
import 'package:flutter/material.dart';
import 'package:visitor/utils/style/color.dart';

// How to Use             
//Text("สแกนหน้าหน้าเข้าอาคารได้เลยค่ะ", style: AppTextStyle.body),



class AppTextStyle {
  static TextStyle get heading {
    var  textStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    fontFamily: 'inter',
    color: Appcolors.heading,

  
  );
    return textStyle;
  }
  static TextStyle body =  TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    fontFamily: 'inter',
    color: Appcolors.title

  );
  static TextStyle textsuccess = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'inter',
    color: Appcolors.title
  );



}
