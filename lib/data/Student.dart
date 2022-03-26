import 'dart:ffi';

class Student{
  late int id;
  late String name;
  late String email;
  late int group_id;
  late bool is_headman;
  late List notifications;

  Student(data){
    id = data["id"];
    name = data["name"];
    email = data["email"];
    group_id = data["group_id"];
    is_headman = data["is_headman"];
    notifications = data["notifications"];
  }
}