import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notey/layout/cubit/notes_states.dart';
import 'package:notey/models/note_model.dart';
import 'package:notey/shared/database_service/database_services.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitialState());

  static NotesCubit get(context) => BlocProvider.of(context);

  String selectCat(String category) {
    emit(SelectCategoryState());
    return category;
  }

  int selectColor(int color) {
    emit(SelectColorState());
    return color;
  }

// data function ***************************************************
  DatabaseService database = DatabaseService();
  List<Note> notes = [];

  void readData() async {
    emit(NotesGetDataLoadingState());
    List<Note> n = [];
    database.readData("SELECT * FROM 'notes' ").then((value) {
      value.forEach((element) {
        n.add(Note.fromJson(element));
      });
      notes = n;
      print('*****************************************');
      print(value);
      print('*****************************************');
      emit(NotesGetDataSuccessState());
    }).catchError((error) {
      emit(NotesGetDataErrorState());
    });

//    List<Map<String,dynamic>> response = await database.readData("SELECT * FROM 'notes' ");
//
//    response.forEach((element) {
//      n.add(Note.fromJson(element));
//    });
//    notes = n;
//    print('*****************************************');
//    print(response);
//    print('*****************************************');
  }

  void inserData({
    required String title,
    required String note,
    required String category,
    required int color,
  }) async {
    int response = await database.insertData(
        'INSERT INTO notes(title, note,color , fav, category , pin, trash) VALUES("$title", "$note" , $color , 0 , "$category" , 0 , 0 )');
    print('inserted successfuly ***********************************');
    readData();
    emit(AddNoteSuccessState());
  }

  void updateData({
    required int id,
    required String title,
    required String note,
    required String category,
    required int trash,
    required int fav,
    required int pin,
    required int color,
  }) async {
    int response = await database.updateData('''
        UPDATE notes SET
        title = "$title" ,
        note = "$note" ,
        category = "$category" ,
        color = $color ,
        trash = $trash ,
        fav = $fav ,
        pin = $pin 
        WHERE id = $id
        ''');
    print('updated successfuly ***********************************');
    readData();
    emit(UpdateNoteSuccessState());
  }

  void deleteData({required int id}) async {
    int response =
        await database.deleteData("DELETE FROM notes WHERE id = $id");
    print('updated successfuly ***********************************');
    readData();
  }

  void swichFav(int id, int co) async {
    co = co == 0 ? 1 : 0;
    int response =
        await database.updateData("UPDATE notes SET fav = $co WHERE id = $id");
    print('updated successfuly ***********************************');
    readData();
  }

  void swichTrash(int id, int co) async {
    co = co == 0 ? 1 : 0;
    int response = await database
        .updateData("UPDATE notes SET trash = $co WHERE id = $id");
    print('updated successfuly ***********************************');
    readData();
  }

  void swichPin(int id, int co) async {
    co = co == 0 ? 1 : 0;
    int response =
        await database.updateData("UPDATE notes SET pin = $co WHERE id = $id");
    print('updated successfuly ***********************************');
    readData();
  }


//*************************************************************
//*************************************************************
//*************************************************************
//*************************************************************
}
