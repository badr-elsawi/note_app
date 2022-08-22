import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notey/layout/cubit/notes_cubit.dart';
import 'package:notey/layout/cubit/notes_states.dart';
import 'package:notey/layout/layout.dart';
import 'package:notey/models/note_model.dart';
import 'package:notey/pages/show_note_page/show_note_page.dart';
import 'package:notey/shared/components/components.dart';
import 'package:notey/shared/styles/styles.dart';
import 'package:page_transition/page_transition.dart';

class TrashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NotesCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: backButton(context),
          ),
          body: getTrash(cubit.notes).length == 0
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        width: width / 3,
                        image: AssetImage('assets/images/no.png'),
                        color: Theme.of(context).primaryColor,
                      ),
                      //SizedBox(height: height / 50),
                      Text(
                        'No notes in trash',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ],
                  ),
                )
              : ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  itemBuilder: (context, index) => _trashItem(
                    context,
                    getTrash(cubit.notes)[index],
                    height,
                    width,
                  ),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: height / 40),
                  itemCount: getTrash(cubit.notes).length,
                ),
        );
      },
    );
  }

  Widget _trashItem(
      BuildContext context, Note note, double height, double width) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: ShowNoteScreen(note),
            type: PageTransitionType.bottomToTop,
          ),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 50),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.1),
                spreadRadius: 1.5,
                blurRadius: 1,
                offset: Offset(0, 1))
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${note.title}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 14),
                ),
                Text(
                  '${note.note}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 13),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                NotesCubit.get(context).swichTrash(note.id!, note.trash!);
              },
              icon: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: Icon(
                  Icons.refresh_rounded,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(width: width / 25),
            IconButton(
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
                          'Delete ${note.title} Forever ?',
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
                            NotesCubit.get(context).deleteData(id: note.id!);
                            Navigator.pop(context);
                          },
                          borderRadius: BorderRadius.circular(100),
                          child: CircleAvatar(
                            radius: height / 25,
                            foregroundColor: Theme.of(context).iconTheme.color,
                            backgroundColor: CircleButtonColors.del,
                            child: Icon(Icons.delete_outline_rounded,
                                size: height / 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              padding: EdgeInsets.all(0),
              icon: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: Icon(
                  Icons.delete_rounded,
                  color: CircleButtonColors.del,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
