import 'package:hive_flutter/hive_flutter.dart';

import 'Lesson.dart';

part 'Schedule.g.dart';

@HiveType(typeId: 1)
class Schedule {
  @HiveField(0)
  late List<Lesson> mon = [];
  @HiveField(1)
  late List<Lesson> tue = [];
  @HiveField(2)
  late List<Lesson> wed = [];
  @HiveField(3)
  late List<Lesson> thu = [];
  @HiveField(4)
  late List<Lesson> fri = [];
  @HiveField(5)
  late List<Lesson> sat = [];

  List<Lesson> operator [](int i) {
    switch (i) {
      case 0:
        return mon;
      case 1:
        return tue;
      case 2:
        return wed;
      case 3:
        return thu;
      case 4:
        return fri;
      case 5:
        return sat;
    }
    return [];
  }

  Schedule();

  Schedule.upperWeek(data) {
    for (dynamic item in data['lessons']['MON']) {
      if (item["up_week"]) {
        mon.add(Lesson.fromData(item));
      }
    }

    for (dynamic item in data['lessons']['TUE']) {
      if (item["up_week"]) {
        tue.add(Lesson.fromData(item));
      }
    }

    for (dynamic item in data['lessons']['WED']) {
      if (item["up_week"]) {
        wed.add(Lesson.fromData(item));
      }
    }

    for (dynamic item in data['lessons']['THU']) {
      if (item["up_week"]) {
        thu.add(Lesson.fromData(item));
      }
    }

    for (dynamic item in data['lessons']['FRI']) {
      if (item["up_week"]) {
        fri.add(Lesson.fromData(item));
      }
    }

    for (dynamic item in data['lessons']['SAT']) {
      if (item["up_week"]) {
        sat.add(Lesson.fromData(item));
      }
    }
  }

  Schedule.lowerWeek(data) {
    for (dynamic item in data['lessons']['MON']) {
      if (!item["up_week"]) {
        mon.add(Lesson.fromData(item));
      }
    }

    for (dynamic item in data['lessons']['TUE']) {
      if (!item["up_week"]) {
        tue.add(Lesson.fromData(item));
      }
    }

    for (dynamic item in data['lessons']['WED']) {
      if (!item["up_week"]) {
        wed.add(Lesson.fromData(item));
      }
    }

    for (dynamic item in data['lessons']['THU']) {
      if (!item["up_week"]) {
        thu.add(Lesson.fromData(item));
      }
    }

    for (dynamic item in data['lessons']['FRI']) {
      if (!item["up_week"]) {
        fri.add(Lesson.fromData(item));
      }
    }

    for (dynamic item in data['lessons']['SAT']) {
      if (!item["up_week"]) {
        sat.add(Lesson.fromData(item));
      }
    }
  }


}
