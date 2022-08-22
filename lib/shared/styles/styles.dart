import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Color(0xff358874),
  accentColor: Color(0xff69B092),
  scaffoldBackgroundColor: Color(0xffDFEBE1),
  backgroundColor: Color(0xffB4D5C0),
  appBarTheme: AppBarTheme(
      backgroundColor: Color(0xffDFEBE1),
      elevation: 0,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xffDFEBE1),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(
        color: Color(0xff358874),
      )),
  // icons themes ***************************
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
  // Text themes ***************************
  textTheme: TextTheme(
    // text form field text
    caption: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w300,
      color: Colors.black,
      fontSize: 18,
    ),
    // appbar text
    headline1: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontSize: 20,
    ),
    headline3: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontSize: 20,
    ),
    headline4: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontSize: 20,
    ),
    headline2: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w700,
      color: Color(0xff358874),
      fontSize: 18,
    ),
    // Categories Text ***********************************
    headline5: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w300,
      color: Colors.black,
      fontSize: 18,
    ),
    headline6: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w300,
      color: Colors.white,
      fontSize: 18,
    ),
    // Categories Text ***********************************
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Color(0xff358874),
      textStyle: TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontWeight: FontWeight.w700,
        color: Color(0xff358874),
        fontSize: 18,
      ),
    ),
  ),
  cardColor: Color(0xffB4D5C0),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: Color(0xff358874),
  ),
);

//**************************************************************************************
//**************************************************************************************



class CircleButtonColors{
  static Color delete = Color(0xffCC9570);
  static Color pin = Color(0xff69B092);
  static Color favorite = Color(0xff69B092);
  static Color del = Color(0xffB05C4E);
}
