import 'dart:ffi';

class Group{
  late int id;
  late int group_number;
  late int group_course;
  late int headman_id;
  // TODO Добавить DIRECTION

  Group(data){
    id = data["id"];
    group_number = data["group_number"];
    group_course = data["group_course"];
    headman_id = data["headman_id"];
  }

  getGroupTitle(){
    return group_course.toString() + "." + group_number.toString();
  }
}