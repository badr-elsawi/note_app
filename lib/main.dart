import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notey/layout/cubit/notes_cubit.dart';
import 'package:notey/layout/layout.dart';
import 'package:notey/pages/add_note_page/add_note_page.dart';
import 'package:notey/shared/cash/cash_service.dart';
import 'package:notey/shared/cubit/app_cubit.dart';
import 'package:notey/shared/cubit/app_states.dart';
import 'package:notey/shared/styles/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashService.init();
  bool? c = CashService.getBool(key: 'isDark');
  runApp(MyApp(c));
}

class MyApp extends StatelessWidget {
  bool? isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit()..getTheme(isDark)),
        BlocProvider(create: (BuildContext context) => NotesCubit()..readData()),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = AppCubit.get(context) ;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            title: 'notes app',
            home: Home(),
          );
        },
      ),
    );
  }
}
