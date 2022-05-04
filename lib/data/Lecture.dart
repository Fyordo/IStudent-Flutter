import 'package:intl/intl.dart';

class Lecture {
  late int id;
  late String strdate;
  late DateTime date;
  late String teacher;
  String additions = "-";

  Lecture.fromData(data) {
    id = data["id"];
    strdate = data["date"];
    DateFormat format = DateFormat("dd.MM.yyyy");
    date = format.parse(strdate);
    teacher = data["teacher"]["name"];
  }
}