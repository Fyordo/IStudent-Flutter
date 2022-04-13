import 'package:hive_flutter/hive_flutter.dart';
import 'package:i_student/data/LessonAddiction.dart';
import 'package:i_student/data/Teacher.dart';

part 'Lesson.g.dart';

@HiveType(typeId: 2)
class Lesson {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String time;
  @HiveField(2)
  late int _lesson_number;
  @HiveField(3)
  late String location;
  @HiveField(4)
  late Teacher teacher;
  late List<LessonAddiction> addictions;

  Lesson();

  Lesson.fromData(data) {
    title = data["title"];
    _lesson_number = data["lesson_number"];
    switch (data["lesson_number"]) {
      case 1:
        time = "8:00\n9:35";
        break;
      case 2:
        time = "9:50\n11:25";
        break;
      case 3:
        time = "11:55\n13:30";
        break;
      case 4:
        time = "13:45\n15:20";
        break;
      case 5:
        time = "15:50\n17:25";
        break;
      case 6:
        time = "17:40\n19:15";
        break;
      default:
        time = "??";
    }
    location = data["location"] ?? "-";
    teacher = data["teacher"] == null ? Teacher.defaultTeacher() : Teacher.fromData(data["teacher"]);
    addictions = [];

    for (dynamic addiction in data["addictions"]){
      addictions.add(LessonAddiction(addiction));
    }
  }

  String start(){
    switch (_lesson_number) {
      case 1:
        return "8:00";
      case 2:
        return "9:50";
      case 3:
        return "11:55";
      case 4:
        return "13:45";
      case 5:
        return "15:50";
      case 6:
        return "17:40";
      default:
        return "??";
    }
  }

  String end(){
    switch (_lesson_number) {
      case 1:
        return "9:35";
      case 2:
        return "11:25";
      case 3:
        return "13:30";
      case 4:
        return "15:20";
      case 5:
        return "17:25";
      case 6:
        return "19:15";
      default:
        return "??";
    }
  }
}
