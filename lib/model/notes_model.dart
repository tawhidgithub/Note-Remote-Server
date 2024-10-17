class NotesModel {
  final String title;
  final String? id;
  final String? key;
  final dynamic description;
  NotesModel({this.id, this.key, required this.title, required this.description});

  NotesModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        title = res["title"],
        key = res["key"],
        description = res["discription"];

  Map<String, Object?> toMap() {
    return {"id": id, "title": title, "discription": description,"key":key};
  }
}
