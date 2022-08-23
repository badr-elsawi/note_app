import 'package:flutter/material.dart';
import 'package:notey/models/note_model.dart';

Widget textInput({
  required TextEditingController controller,
  required String errorMessage,
  required BuildContext context,
  required String hint,
  int maxLines = 1,
  bool readOnly = false,
  TextInputType keyboard = TextInputType.text,
  TextInputAction textInputAction = TextInputAction.none,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboard,
    maxLines: maxLines,
    validator: (String? v) {
      if (v!.isEmpty) {
        return errorMessage;
      }
    },
    readOnly: readOnly,
    textInputAction: textInputAction,
    //***********************
    style: Theme.of(context).textTheme.bodyText1,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: Theme.of(context).textTheme.caption,
      //prefixIcon: prefixIcon,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // Borders ********************************
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: 0.2,
          color: Theme.of(context).primaryColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: 0.2,
          color: Theme.of(context).primaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: 0.2,
          color: Theme.of(context).primaryColor,
        ),
      ),
      // Borders ****************************************
    ),
  );
}

List<Note> getNotes(List<Note> notes) {
  List<Note> filter = [];
  for (int i = 0; i < notes.length; i++) {
    if (notes[i].trash == 0) {
      filter.add(notes[i]);
    } else {
      continue;
    }
  }
  return filter;
}

List<Note> getTrash(List<Note> notes) {
  List<Note> filter = [];
  for (int i = 0; i < notes.length; i++) {
    if (notes[i].trash == 1) {
      filter.add(notes[i]);
    } else {
      continue;
    }
  }
  return filter;
}

List<Note> getPins(List<Note> notes) {
  List<Note> filter = [];
  for (int i = 0; i < notes.length; i++) {
    if (notes[i].pin == 1 && notes[i].trash == 0) {
      filter.add(notes[i]);
    } else {
      continue;
    }
  }
  return filter;
}

List<Note> getFavs(List<Note> notes) {
  List<Note> filter = [];
  for (int i = 0; i < notes.length; i++) {
    if (notes[i].fav == 1 && notes[i].trash == 0) {
      filter.add(notes[i]);
    } else {
      continue;
    }
  }
  return filter;
}

Widget backButton(BuildContext context) {
  return IconButton(
    onPressed: () {
      Navigator.pop(context);
    },
    icon: Icon(
      Icons.arrow_back_ios_rounded,
      color: Theme.of(context).primaryColor,
    ),
  );
}


List<Note> getCat(List<Note> notes,String cat) {
  List<Note> filter = [];
  if(cat == 'All'){
    return notes;
  }
  else{
    for (int i = 0; i < notes.length; i++) {
      if (notes[i].category == cat) {
        filter.add(notes[i]);
      } else {
        continue;
      }
    }
    return filter;
  }
}


