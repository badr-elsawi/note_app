import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notey/shared/cash/cash_service.dart';
import 'package:notey/shared/cubit/app_states.dart';
import 'package:notey/shared/styles/styles.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void getTheme(bool? j) {
    if (j != null) {
      isDark = j;
    }
  }

  void switchTheme() async {
    isDark = !isDark;
    await CashService.setBool(key: 'isDark', value: isDark);
    emit(DarkThemeState());
  }

  List<int> colors = [
    Color(0xff99c4a3).value,
    Color(0xff38a9ff).value,
    Color(0xff68b0f7).value,
    Color(0xff084854).value,
    Color(0xff174c57).value,
    Color(0xff48a3a8).value,
    Color(0xff003e54).value,
    Color(0xff48a88a).value,
    Color(0xff085444).value,
    Color(0xff2bb389).value,
    Color(0xff1f5939).value,
    Color(0xff449e77).value,
    Color(0xff17573b).value,
    Color(0xff1f5939).value,
    Color(0xff48a865).value,
    Color(0xff914e2d).value,
    Color(0xff7d2f2f).value,
    Color(0xffa84865).value,
    Color(0xffa84848).value,
    Color(0xff9e4486).value,
    Color(0xff571735).value,
    Color(0xff6e0335).value,
    Color(0xffff8c8c).value,
    Color(0xfff578bd).value,
    Color(0xff702246).value,
    Color(0xff612d53).value,
    Color(0xfff2d56b).value,
    Color(0xfff2b16b).value,
    Color(0xffeb8052).value,
    Color(0xfff5aeae).value,
  ];
  ThemeData myTheme = themak(color);
  static int color = Color(0xff38a9ff).value;

  Future<int> changeColor(int? c) async {
    if (c != null) {
      color = Color(c).value;
      myTheme = themak(color);
      await CashService.setInt(key: 'color', value: c);
      emit(DarkColorState());
      return color;
    } else {
      color = Color(0xfff5aeae).value;
      emit(DarkColorState());
      return color;
    }
  }

  int selectColor(int c) {
    color = Color(c).value;
    emit(DarkColorState());
    return color;
  }

//*******************************************************************************
//*******************************************************************************
}
