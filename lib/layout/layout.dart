import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notey/layout/cubit/notes_cubit.dart';
import 'package:notey/layout/cubit/notes_states.dart';
import 'package:notey/models/note_model.dart';
import 'package:notey/pages/add_note_page/add_note_page.dart';
import 'package:notey/pages/favorites_page/favorites_page.dart';
import 'package:notey/pages/show_note_page/show_note_page.dart';
import 'package:notey/pages/trash_page/trash_page.dart';
import 'package:notey/shared/components/components.dart';
import 'package:notey/shared/styles/styles.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatelessWidget {
  List<String> categories = [
    'All',
    'Family',
    'Health',
    'Food',
    'Sport',
    'Tech',
    'Travel',
    'Money',
    'Education',
  ];
  String category = 'All';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NotesCubit.get(context);
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          drawer: myDrawer(context, height, width),
          body: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                //pinned: true,
                floating: false,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: getPins(cubit.notes).length == 0
                      ? _noPins(context, height, width)
                      : _pinLayout(context, cubit, height, width),
                  collapseMode: CollapseMode.parallax,
                  centerTitle: true,
                ),
                centerTitle: true,
                expandedHeight: height / 2.5,
                elevation: 0,
              ),
              getNotes(cubit.notes).length == 0
                  ? _noNotes(context, height, width)
                  : _notesLayout(context, cubit, height, width),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  child: AddNoteScreen(),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            },
            child: Icon(Icons.edit),
          ),
        );
      },
    );
  }

  Widget _noPins(
    BuildContext context,
    double height,
    double width,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: height / 15,
            width: width / 6,
            fit: BoxFit.contain,
            color: Theme.of(context).primaryColor,
            image: AssetImage('assets/images/t.png'),
          ),
          Text(
            'No Pinned yet !',
            style: TextStyle(
              fontFamily: 'IBMPlexSansArabic',
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _pinLayout(
    BuildContext context,
    NotesCubit cubit,
    double height,
    double width,
  ) {
    return Container(
      //alignment: Alignment.center,
      padding: EdgeInsetsDirectional.only(
        top: height / 9,
        bottom: height / 25,
        start: 0,
        end: 0,
      ),
      height: height / 3,
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: width / 20),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            _pinNote(context, height, width, getPins(cubit.notes)[index]),
        separatorBuilder: (context, index) => SizedBox(width: width / 20),
        itemCount: getPins(cubit.notes).length,
      ),
    );
  }

  Widget _pinNote(
    BuildContext context,
    double height,
    double width,
    Note note,
  ) {
    return Container(
      height: height / 10,
      width: height / 3,
      padding: EdgeInsetsDirectional.only(
          top: height / 60,
          bottom: height / 50,
          start: width / 20,
          end: width / 20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
              spreadRadius: 1.5,
              blurRadius: 1,
              offset: Offset(0, 1))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${note.title}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(
            '${note.note}',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: height / 40),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                padding: EdgeInsets.all(0),
                iconSize: height / 30,
                onPressed: () {
                  NotesCubit.get(context).swichPin(note.id!, note.pin!);
                },
                icon: CircleAvatar(
                  foregroundColor: Theme.of(context).iconTheme.color,
                  backgroundColor: CircleButtonColors.pin,
                  child: Icon(
                    note.pin == 1
                        ? Icons.push_pin_rounded
                        : Icons.push_pin_outlined,
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.all(0),
                iconSize: height / 30,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      height: height / 6,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: width / 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: height / 80),
                          Text(
                            'move ${note.title} to trash ?',
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
                              NotesCubit.get(context)
                                  .swichTrash(note.id!, note.trash!);
                              NotesCubit.get(context)
                                  .swichPin(note.id!, note.pin!);
                              NotesCubit.get(context)
                                  .swichFav(note.id!, note.pin!);
                              Navigator.pop(context);
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
              IconButton(
                padding: EdgeInsets.all(0),
                iconSize: height / 30,
                onPressed: () {
                  NotesCubit.get(context).swichFav(note.id!, note.fav!);
                },
                icon: CircleAvatar(
                  foregroundColor: Theme.of(context).iconTheme.color,
                  backgroundColor: CircleButtonColors.favorite,
                  child: Icon(
                    note.fav == 0
                        ? Icons.favorite_outline_rounded
                        : Icons.favorite_rounded,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //**********************************************************
  Widget _notesLayout(
    BuildContext context,
    NotesCubit cubit,
    double height,
    double width,
  ) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsetsDirectional.only(
          top: height / 40,
          bottom: getCat(getNotes(cubit.notes), category).length > 3
              ? height / 20
              : height / 2,
        ),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            )),
        child: Column(
          children: [
            Container(
              height: height / 20,
              padding: EdgeInsets.symmetric(),
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    _catItem(categories[index], context, height, width),
                separatorBuilder: (context, index) =>
                    SizedBox(width: width / 20),
                itemCount: categories.length,
              ),
            ),
            SizedBox(height: height / 40),
            ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => _noteItem(context, height, width,
                  getCat(getNotes(cubit.notes), category)[index]),
              separatorBuilder: (context, index) =>
                  SizedBox(height: height / 40),
              itemCount: getCat(getNotes(cubit.notes), category).length,
            ),
          ],
        ),
      ),
    );
  }

  Widget _noteItem(
    BuildContext context,
    double height,
    double width,
    Note note,
  ) {
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
        padding: EdgeInsetsDirectional.only(
            top: height / 60,
            bottom: height / 50,
            start: width / 20,
            end: width / 20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
              spreadRadius: 1.5,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${note.title}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              '${note.note}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: height / 40),
            Row(
              children: [
                SizedBox(width: width / 3),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 60),
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    iconSize: height / 30,
                    onPressed: () {
                      NotesCubit.get(context).swichPin(note.id!, note.pin!);
                    },
                    icon: CircleAvatar(
                      foregroundColor: Theme.of(context).iconTheme.color,
                      backgroundColor: CircleButtonColors.pin,
                      child: Icon(
                        note.pin == 1
                            ? Icons.push_pin_rounded
                            : Icons.push_pin_outlined,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 60),
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    iconSize: height / 30,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          height: height / 6,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: width / 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: height / 80),
                              Text(
                                'move ${note.title} to trash ?',
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
                                  NotesCubit.get(context)
                                      .swichTrash(note.id!, note.trash!);
                                  NotesCubit.get(context)
                                      .swichPin(note.id!, note.pin!);
                                  NotesCubit.get(context)
                                      .swichFav(note.id!, note.pin!);
                                  Navigator.pop(context);
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 60),
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    iconSize: height / 30,
                    onPressed: () {
                      NotesCubit.get(context).swichFav(note.id!, note.fav!);
                    },
                    icon: CircleAvatar(
                      foregroundColor: Theme.of(context).iconTheme.color,
                      backgroundColor: CircleButtonColors.favorite,
                      child: Icon(
                        note.fav == 0
                            ? Icons.favorite_outline_rounded
                            : Icons.favorite_rounded,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _noNotes(BuildContext context, double height, double width) {
    return SliverToBoxAdapter(
      child: Container(
        height: height / 1.2,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 40),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Image(
              width: width / 3,
              image: AssetImage('assets/images/no.png'),
              color: Theme.of(context).primaryColor,
            ),
            //SizedBox(height: height / 50),
            Text(
              'No notes yet',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  //category item
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
          color: cat == category
              ? Theme.of(context).primaryColor
              : Theme.of(context).accentColor.withOpacity(0.2),
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

  Widget myDrawer(BuildContext context, double height, double width) {
    return Container(
      width: width / 1.5,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: height / 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: TrashScreen(),
                  type: PageTransitionType.leftToRight,
                ),
              );
            },
            focusColor: Theme.of(context).primaryColor,
            hoverColor: Theme.of(context).primaryColor,
            leading: Icon(Icons.delete_rounded),
            title: Text(
              'Trash',
              style: Theme.of(context).textTheme.headline4!.merge(
                    TextStyle(
                      fontSize: 16,
                    ),
                  ),
            ),
            trailing: getTrash(NotesCubit.get(context).notes).length == 0
                ? null
                : CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(
                      '${getTrash(NotesCubit.get(context).notes).length}',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                    ),
                  ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: FavoritesScreen(),
                  type: PageTransitionType.leftToRight,
                ),
              );
            },
            focusColor: Theme.of(context).primaryColor,
            hoverColor: Theme.of(context).primaryColor,
            leading: Icon(Icons.favorite_rounded),
            title: Text(
              'Favorites',
              style: Theme.of(context).textTheme.headline4!.merge(
                    TextStyle(
                      fontSize: 16,
                    ),
                  ),
            ),
            trailing: getFavs(NotesCubit.get(context).notes).length == 0
                ? null
                : CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(
                      '${getFavs(NotesCubit.get(context).notes).length}',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
