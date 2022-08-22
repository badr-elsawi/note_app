import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notey/shared/cash/cash_service.dart';
import 'package:notey/shared/cubit/app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void getTheme (bool? j){
    if(j != null){
      isDark = j;
    }
  }


  void switchTheme()async{
    isDark = !isDark;
    await CashService.setBool(key: 'isDark', value: isDark);
    emit(DarkThemeState());
  }
}