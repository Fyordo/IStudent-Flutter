class Lesson {
  late String title;
  late String time;
  late String location;
  late String teacher;

  Lesson(data) {
    title = data["title"];
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
    teacher = data["teacher"] == null ? "-" : (data["teacher"]["name"] ?? "-");
  }
}