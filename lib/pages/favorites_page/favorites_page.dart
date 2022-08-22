import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notey/layout/cubit/notes_cubit.dart';
import 'package:notey/layout/cubit/notes_states.dart';
import 'package:notey/layout/layout.dart';
import 'package:notey/models/note_model.dart';
import 'package:notey/pages/show_note_page/show_note_page.dart';
import 'package:notey/shared/components/components.dart';
import 'package:page_transition/page_transition.dart';

class FavoritesScreen extends StatelessWidget {
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
          ),
          body: getFavs(cubit.notes).length == 0
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
                  'No Favorites yet !',
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
            itemBuilder: (context, index) => _favItem(
              context,
              getFavs(cubit.notes)[index],
              height,
              width,
            ),
            separatorBuilder: (context, index) =>
                SizedBox(height: height / 40),
            itemCount: getFavs(cubit.notes).length,
          ),
        );
      },
    );
  }

  Widget _favItem(
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
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
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
                NotesCubit.get(context).swichFav(note.id!, note.fav!);
              },
              icon: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: Icon(
                  Icons.favorite_rounded,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}