import 'dart:ffi';

import 'Group.dart';

class Student{
  late int id;
  late String name;
  late String email;
  late String photo;
  late Group group;
  late bool is_headman;
  late List notifications;

  Student(data){
    id = data["id"];
    name = data["name"];
    email = data["email"];
    group = new Group(data["group"]);
    is_headman = data["is_headman"];
    notifications = data["notifications"];
    photo = data["photo"];
  }

}