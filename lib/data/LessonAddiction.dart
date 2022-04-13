class LessonAddiction{
  late int id;
  late String date;
  late int groupId;
  late String description;

  LessonAddiction(data) {
    id = data["id"];
    date = data["date"]["date"];
    groupId = data["group_id"];
    description = data["description"];
  }
}