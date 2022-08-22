import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notey/layout/cubit/notes_cubit.dart';
import 'package:notey/layout/layout.dart';
import 'package:notey/pages/add_note_page/add_note_page.dart';
import 'package:notey/shared/cubit/app_cubit.dart';
import 'package:notey/shared/cubit/app_states.dart';
import 'package:notey/shared/styles/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit()),
        BlocProvider(create: (BuildContext context) => NotesCubit()..readData()),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            title: 'notes app',
            home: Home(),
          );
        },
      ),
    );
  }
}
