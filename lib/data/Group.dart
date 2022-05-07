

//import 'dart:ffi';

import 'package:i_student/data/Student.dart';

class Group {
  late int id;
  late int group_number;
  late String group_course;
  late int headman_id;
  late List<Student> students;

  // TODO Добавить DIRECTION

  Group(data) {
    id = data["id"];
    group_number = data["group_number"];
    group_course = data["group_course"];
    headman_id = data["headman_id"];
    students = [];
  }

  getGroupTitle() {
    return group_course.toString() + "." + group_number.toString();
  }

  setStudents(data){
    for (dynamic item in data){
      students.add(item);
    }
  }
}
