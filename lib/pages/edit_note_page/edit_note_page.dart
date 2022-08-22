import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notey/layout/cubit/notes_cubit.dart';
import 'package:notey/layout/cubit/notes_states.dart';
import 'package:notey/layout/layout.dart';
import 'package:notey/models/note_model.dart';
import 'package:notey/shared/components/components.dart';
import 'package:page_transition/page_transition.dart';

class EditNoteScreen extends StatelessWidget {
  Note model;

  EditNoteScreen(this.model);

  var formKey = GlobalKey<FormState>();
  List<String> categories = [
    'Family',
    'Health',
    'Food',
    'Sport',
    'Tech',
    'Travel',
    'Money',
    'Education',
  ];
  var title = TextEditingController();
  var note = TextEditingController();
  String category = '';

  List<int> colors = [
    Color(0xff99c4a3).value,
    Color(0xfff5daae).value,
    Color(0xfff5aeae).value,
    Color(0xff95dfe6).value,
    Color(0xffbaa0a0).value,
  ];
  int color = 0;

  void setto() {
    category == '' ? category = model.category! : null;
    color == 0 ? color = model.color! : null;
    title.text.isEmpty
        ? title = TextEditingController(text: model.title!)
        : null;
    note.text.isEmpty ? note = TextEditingController(text: model.note!) : null;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {
        if (state is UpdateNoteSuccessState) {
          Navigator.pushReplacement(
            context,
            PageTransition(
              child: Home(),
              type: PageTransitionType.leftToRight,
            ),
          );
        }
      },
      builder: (context, state) {
        setto();
        var cubit = NotesCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: backButton(context),
            title: Text(
              'Edit note',
              style: Theme.of(context).textTheme.headline1,
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.only(end: width / 20),
                child: TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.updateData(
                        id: model.id!,
                        title: title.text,
                        note: note.text,
                        category: category,
                        trash: model.trash!,
                        fav: model.fav!,
                        pin: model.pin!,
                        color: color,
                      );
                    }
                  },
                  child: Text(
                    'SAVE',
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: width / 20, vertical: height / 50),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textInput(
                    controller: title,
                    errorMessage: '',
                    context: context,
                    hint: 'Title',
                    maxLines: 1,
                  ),
                  SizedBox(height: height / 60),
                  textInput(
                    controller: note,
                    errorMessage: '',
                    context: context,
                    hint: 'Note',
                    maxLines: 18,
                    textInputAction: TextInputAction.newline,
                    keyboard: TextInputType.multiline,
                  ),
                  SizedBox(height: height / 100),
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(height: height / 100),
                  Container(
                    height: height / 20,
                    padding: EdgeInsets.symmetric(),
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => _catItem(
                        categories[index],
                        context,
                        height,
                        width,
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: width / 20),
                      itemCount: categories.length,
                    ),
                  ),
                  SizedBox(height: height / 100),
                  Text(
                    'Colors',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  SizedBox(height: height / 100),
                  Container(
                    height: height / 20,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => _colorItem(
                        colors[index],
                        context,
                        height,
                        width,
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: width / 20),
                      itemCount: colors.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _catItem(
    String cat,
    BuildContext context,
    double h,
    double w,
  ) {
    return InkWell(
      onTap: () {
        category = NotesCubit.get(context).selectCat(cat);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        alignment: Alignment.center,
        height: h / 28,
        padding: EdgeInsets.symmetric(horizontal: w / 20),
        decoration: BoxDecoration(
          color:
              cat == category ? Theme.of(context).primaryColor : Theme.of(context).accentColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          '$cat',
          style: cat == category
              ? Theme.of(context).textTheme.headline6
              : Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }

  Widget _colorItem(
    int c,
    BuildContext context,
    double h,
    double w,
  ) {
    return IconButton(
      onPressed: () {
        color = NotesCubit.get(context).selectColor(c);
      },
      iconSize: h / 40,
      padding: EdgeInsets.all(0),
      icon: CircleAvatar(
        radius: h / 25,
        backgroundColor: Color(c),
        foregroundColor: Colors.black,
        child: c == color ? Icon(Icons.check) : SizedBox(),
      ),
    );
  }
}


