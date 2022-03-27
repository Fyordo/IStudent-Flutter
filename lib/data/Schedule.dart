import 'Lesson.dart';

class Schedule {

  late List<Lesson> mon = [];
  late List<Lesson> tue = [];
  late List<Lesson> wed = [];
  late List<Lesson> thu = [];
  late List<Lesson> fri = [];
  late List<Lesson> sat = [];

  List<Lesson> operator[](int i) {
    switch(i) {
      case 1:
        return mon;
      case 2:
        return tue;
      case 3:
        return wed;
      case 4:
        return thu;
      case 5:
        return fri;
      case 6:
        return sat;
    }
    return [];
  }

  Schedule(data) {
    for (dynamic item in data['lessons']['MON']){
      mon.add(Lesson(item));
    }


    for (dynamic item in data['lessons']['TUE']){
      tue.add(Lesson(item));
    }

    for (dynamic item in data['lessons']['WED']){
      wed.add(Lesson(item));
    }

    for (dynamic item in data['lessons']['THU']){
      thu.add(Lesson(item));
    }

    for (dynamic item in data['lessons']['FRI']){
      fri.add(Lesson(item));
    }

    for (dynamic item in data['lessons']['SAT']){
      sat.add(Lesson(item));
    }
  }


}