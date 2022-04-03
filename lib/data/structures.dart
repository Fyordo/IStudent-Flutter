class Lesson {
  String name;
  String place;
  String time;

  Lesson(this.name, this.place, this.time);
}

List<String> Days = [
  'Понедельник',
  'Вторник',
  'Среда',
  'Четверг',
  'Пятница',
  'Суббота'
];

class Day {
  String name;
  int count;
  List<Lesson> lessons;

  Day(this.name, this.count, this.lessons);
}

Day monday = Day("Понедельник", 4, [
  Lesson("Предмет", "Аудитория", "XX:XX\nXX:XX"),
  Lesson("Предмет", "Аудитория", "XX:XX\nXX:XX"),
  Lesson("Предмет", "Аудитория", "XX:XX\nXX:XX"),
  Lesson("Предмет", "Аудитория", "XX:XX\nXX:XX")
]);
Day tuesday = Day("Вторник", 3, [
  Lesson("Предмет", "Аудитория", "XX:XX - XX:XX"),
  Lesson("Предмет", "Аудитория", "XX:XX - XX:XX"),
  Lesson("Предмет", "Аудитория", "XX:XX - XX:XX")
]);
Day wednesday = Day("Среда", 3, [
  Lesson("Предмет", "Аудитория", "XX:XX - XX:XX"),
  Lesson("Предмет", "Аудитория", "XX:XX - XX:XX"),
  Lesson("Предмет", "Аудитория", "XX:XX - XX:XX")
]);
Day thursday = Day("Четверг", 3, [
  Lesson("Предмет", "Аудитория", "XX:XX - XX:XX"),
  Lesson("Предмет", "Аудитория", "XX:XX - XX:XX"),
  Lesson("Предмет", "Аудитория", "XX:XX - XX:XX")
]);
Day friday = Day("Пятница", 3, [
  Lesson("Предмет", "Аудитория", "XX:XX - XX:XX"),
  Lesson("Предмет", "Аудитория", "XX:XX - XX:XX"),
  Lesson("Предмет", "Аудитория", "XX:XX - XX:XX")
]);
Day saturday = Day("Суббота", 3, [
  Lesson("Предмет", "Аудитория", "XX:XX - XX:XX"),
  Lesson("Предмет", "Аудитория", "XX:XX - XX:XX"),
  Lesson("Предмет", "Аудитория", "XX:XX - XX:XX")
]);

List<Day> days = [monday, tuesday, wednesday, thursday, friday, saturday];
