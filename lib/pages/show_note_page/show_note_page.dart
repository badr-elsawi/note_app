import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notey/layout/cubit/notes_cubit.dart';
import 'package:notey/layout/cubit/notes_states.dart';
import 'package:notey/layout/layout.dart';
import 'package:notey/models/note_model.dart';
import 'package:notey/pages/edit_note_page/edit_note_page.dart';
import 'package:notey/shared/components/components.dart';
import 'package:notey/shared/styles/styles.dart';
import 'package:page_transition/page_transition.dart';

class ShowNoteScreen extends StatelessWidget {
  Note model;

  ShowNoteScreen(this.model);

  var title = TextEditingController();
  var note = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NotesCubit.get(context);
        return Scaffold(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          appBar: AppBar(
            leading: backButton(context),
            title: Text(
              '${model.title}',
              style: Theme.of(context).textTheme.headline1,
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.only(end: width / 20),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: EditNoteScreen(model),
                        type: PageTransitionType.fade,
                      ),
                    );
                  },
                  child: Text(
                    'EDIT',
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: width / 20, vertical: height / 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textInput(
                  controller: title,
                  errorMessage: '',
                  context: context,
                  hint: '${model.title}',
                  maxLines: 1,
                  readOnly: true,
                ),
                SizedBox(height: height / 60),
                textInput(
                  controller: note,
                  errorMessage: '',
                  context: context,
                  hint: '${model.note}',
                  maxLines: 18,
                  readOnly: true,
                ),
                SizedBox(height: height / 100),
                Center(
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    iconSize: height / 10,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            color: Theme.of(context).backgroundColor,
                          ),
                          height: height / 6,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: height / 80),
                              Text(
                                'move ${model.title} to trash ?',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .merge(TextStyle(
                                      fontSize: 16,
                                    )),
                              ),
                              SizedBox(height: height / 80),
                              InkWell(
                                onTap: () {
                                  cubit.swichTrash(model.id!, model.trash!);
                                  if (model.pin == 1) {
                                    cubit.swichPin(model.id!, model.pin!);
                                  }
                                  if (model.fav == 1) {
                                    cubit.swichFav(model.id!, model.fav!);
                                  }
                                  Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                      child: Home(),
                                      type: PageTransitionType.bottomToTop,
                                    ),
                                  );
                                },
                                borderRadius: BorderRadius.circular(100),
                                child: CircleAvatar(
                                  radius: height / 25,
                                  foregroundColor:
                                      Theme.of(context).iconTheme.color,
                                  backgroundColor: CircleButtonColors.delete,
                                  child: Icon(Icons.delete_outline_rounded,
                                      size: height / 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    icon: CircleAvatar(
                      foregroundColor: Theme.of(context).iconTheme.color,
                      backgroundColor: CircleButtonColors.delete,
                      child: Icon(Icons.delete_outline_rounded),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
