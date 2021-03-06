import 'Group.dart';

class Student {
  late int id;
  late String name;
  late String email;
  late String photo;
  late Group group;
  late bool is_headman;
  late List notifications;

  Student(data, {bool setGroup = true}) {
    id = data["id"];
    name = data["name"];
    email = data["email"];
    if (setGroup){
      group = new Group(data["group"]);
    }
    is_headman = data["is_headman"];
    notifications = data["notifications"];
    photo = data["photo"];
  }

  getLastName() {
    return name.split(' ')[0];
  }

  getFirstName() {
    return name.split(' ')[1];
  }
}
