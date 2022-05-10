import 'dart:collection';

import 'Lecture.dart';

class AllLectures {

  List<String> Categories = [];
  HashMap<String, List<Lecture>> Lectures = HashMap<String, List<Lecture>>();
  HashMap<String, int> Offsets = HashMap<String, int>();

  AllLectures.fromData(data) {
    for (String category in data["list"]) {
      Categories.add(category);

      Lectures[category] = [];


      for (dynamic lecture in data["lessons"][category]) {
        Lectures[category]?.add(Lecture.fromData(lecture));
      }


      Offsets[category] = 0;
      if (Lectures[category] != null) {
        var now = DateTime.now();
        for (Lecture lecture in Lectures[category]!) {
          var date = lecture.date;
          if (date.month >= now.month && date.day >= now.day) {
            break;
          }
          Offsets[category] = Offsets[category]! + 1;
        }
      }
    }

  }
}