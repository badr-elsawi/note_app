import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notey/layout/cubit/notes_cubit.dart';
import 'package:notey/layout/cubit/notes_cubit.dart';
import 'package:notey/layout/cubit/notes_cubit.dart';
import 'package:notey/shared/cubit/app_cubit.dart';

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
  shadowColor: Color(0xff358874),
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
    bodyText1: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w400,
      color: Colors.black,
      height: 1.2,
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
  dividerColor: Color(0xff358874),
);

//**************************************************************************************
//**************************************************************************************
//**************************************************************************************

ThemeData darkTheme = ThemeData(
  primaryColor: Colors.grey[300],
  accentColor: Colors.grey[400],
  scaffoldBackgroundColor: Colors.black,
  backgroundColor: Color(0xff171717),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(
        color: Colors.grey[300],
      )),
  // icons themes ***************************
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
  shadowColor: Colors.black,
  // Text themes ***************************
  textTheme: TextTheme(
    // text form field text
    caption: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w300,
      color: Colors.white,
      fontSize: 18,
    ),
    // appbar text
    headline1: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 20,
    ),
    headline3: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 20,
    ),
    headline4: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontSize: 20,
    ),
    headline2: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w700,
      color: Color(0xff358874),
      fontSize: 18,
    ),
    bodyText1: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w400,
      color: Colors.white,
      height: 1.2,
      fontSize: 18,
    ),
    // Categories Text ***********************************
    headline5: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w300,
      color: Colors.white,
      fontSize: 18,
    ),
    headline6: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w300,
      color: Colors.black,
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
  cardColor: Color(0xff171717),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: Colors.grey[900],
  ),
  dividerColor: Colors.grey[300],
);




//**************************************************************************************
//**************************************************************************************
//**************************************************************************************
// the main dark theme color
//*************************************************************************************
ThemeData darkTheme2 = ThemeData(
  primaryColor: Color(AppCubit.color),
  accentColor: Color(AppCubit.color),
  scaffoldBackgroundColor: Colors.black,
  backgroundColor: Color(0xff171717),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(
        color: Color(AppCubit.color),
      )),
  // icons themes ***************************
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
  shadowColor: Colors.black,
  // Text themes ***************************
  textTheme: TextTheme(
    // text form field text
    caption: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w300,
      color: Colors.white,
      fontSize: 18,
    ),
    // appbar text
    headline1: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 20,
    ),
    headline3: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 20,
    ),
    headline4: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontSize: 20,
    ),
    headline2: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w700,
      color: Color(0xff358874),
      fontSize: 18,
    ),
    bodyText1: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w400,
      color: Colors.white,
      height: 1.2,
      fontSize: 18,
    ),
    // Categories Text ***********************************
    headline5: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w300,
      color: Colors.white,
      fontSize: 18,
    ),
    headline6: TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontWeight: FontWeight.w300,
      color: Colors.black,
      fontSize: 18,
    ),
    // Categories Text ***********************************
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Color(AppCubit.color),
      textStyle: TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontWeight: FontWeight.w700,
        color: Color(AppCubit.color),
        fontSize: 18,
      ),
    ),
  ),
  cardColor: Color(0xff171717),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Colors.black,
    backgroundColor: Color(AppCubit.color),
  ),
  dividerColor: Colors.grey[300],
);






ThemeData themak(int color){
  return ThemeData(
    primaryColor: Color(color),
    accentColor: Color(color),
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: Color(0xff171717),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        elevation: 0,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        iconTheme: IconThemeData(
          color: Color(color),
        )),
    // icons themes ***************************
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    shadowColor: Colors.black,
    // Text themes ***************************
    textTheme: TextTheme(
      // text form field text
      caption: TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontWeight: FontWeight.w300,
        color: Colors.white,
        fontSize: 18,
      ),
      // appbar text
      headline1: TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontSize: 20,
      ),
      headline3: TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontSize: 20,
      ),
      headline4: TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontSize: 20,
      ),
      headline2: TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontWeight: FontWeight.w700,
        color: Color(0xff358874),
        fontSize: 18,
      ),
      bodyText1: TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontWeight: FontWeight.w400,
        color: Colors.white,
        height: 1.2,
        fontSize: 18,
      ),
      // Categories Text ***********************************
      headline5: TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontWeight: FontWeight.w300,
        color: Colors.white,
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
        primary: Color(color),
        textStyle: TextStyle(
          fontFamily: 'IBMPlexSansArabic',
          fontWeight: FontWeight.w700,
          color: Color(color),
          fontSize: 18,
        ),
      ),
    ),
    cardColor: Color(0xff171717),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
      backgroundColor: Color(color),
    ),
    dividerColor: Colors.grey[300],
  );
}





class CircleButtonColors{
  static Color delete = Color(0xffCC9570);
  static Color pin = Color(0xff69B092);
  static Color favorite = Color(0xff69B092);
  static Color del = Color(0xffB05C4E);
}
