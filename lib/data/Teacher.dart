import 'package:hive_flutter/hive_flutter.dart';

part 'Teacher.g.dart';

@HiveType(typeId: 3)
class Teacher{
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String degree;
  @HiveField(3)
  late String photo;

  Teacher();

  Teacher.fromData(data) {
      id = data["id"];
      name = data["name"];
      degree = data["degree"];
      photo = data["photo"];

  }

  Teacher.defaultTeacher()
  {

    id = -1;
    name = "-";
    degree = "-";
    photo = "-";
  }
}