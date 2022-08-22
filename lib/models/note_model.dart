class Note {
  int? id;
  String? title ;
  String? note ;
  int? fav;
  String? category;
  int? trash;
  int? pin;
  int? color ;

  Note.fromJson(Map<String,dynamic> json){
    id = json['id'];
    title = json['title'];
    note = json['note'];
    color = json['color'];
    fav = json['fav'];
    category = json['category'];
    trash = json['trash'];
    pin = json['pin'];
  }
}