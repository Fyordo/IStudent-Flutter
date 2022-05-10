import 'package:intl/intl.dart';

import 'LessonAddiction.dart';

class Lecture {
  late int id;
  late String strdate;
  late int lesson_number;
  late DateTime date;
  late String teacher;
  late String time;
  late List<LessonAddiction> addictions;

  Lecture.fromData(data) {
    id = data["id"];
    strdate = data["date"];
    lesson_number = data["lesson_number"];
    DateFormat format = DateFormat("dd.MM.yyyy");
    switch (data["lesson_number"]) {
      case 1:
        time = "8:00 - 9:35";
        break;
      case 2:
        time = "9:50 - 11:25";
        break;
      case 3:
        time = "11:55 - 13:30";
        break;
      case 4:
        time = "13:45 - 15:20";
        break;
      case 5:
        time = "15:50 - 17:25";
        break;
      case 6:
        time = "17:40 - 19:15";
        break;
      default:
        time = "??";
    }
    date = format.parse(strdate);
    teacher = data["teacher"]["name"];
    addictions = [];

    for (dynamic addition in data['addictions']){
      addictions.add(LessonAddiction(addition));
    }
  }
}