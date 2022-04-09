class Teacher{
  late int id;
  late String name;
  late String degree;
  late String photo;

  Teacher(data) {
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