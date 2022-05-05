import 'package:flutter/material.dart';
import 'package:i_student/data/Lesson.dart';
import 'package:i_student/data/Schedule.dart';


const List<String> dayNames = [
  "Понедельник",
  "Вторник",
  "Среда",
  "Четверг",
  "Пятница",
  "Суббота"
];

class Timetable extends StatelessWidget {
  final Schedule schedule;

  Timetable(this.schedule);

  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          top: 0,
          bottom: 0,
          left: 0,
        ),
        height: MediaQuery.of(context).size.height - 159, // 159 - волшебное число!!! его не трогать!!!
        child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,

          itemCount: 6,
          itemBuilder: (BuildContext context, int index) => Container(
              margin: EdgeInsets.only(
                top: 5,
                left: 8,
                right: 8,
                bottom: 8
              ),
              width: 350,
              child: Card(
                  elevation: 5,
                  margin: EdgeInsets.only(top: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: ConstructDay(dayNames[index], schedule[index]))),
        ));
  }
}

class ConstructDay extends StatelessWidget {
  final String dayName;
  final List<Lesson> list;

  ConstructDay(this.dayName, this.list);

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _getPairs(list, context)),
    );
  }

  List<Widget> _getPairs(List<Lesson> list, BuildContext context) {
    List<Widget> res = List<Widget>.empty(growable: true);
    res.add(Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 20),
        child: Text(
          dayName,
          style: TextStyle(
              color: Theme.of(context).hintColor,
              fontSize: 22,
              fontWeight: FontWeight.w600),
        )));
    res.add(Divider(
      height: 20,
      thickness: 2,
      indent: 10,
      endIndent: 10,
      color: Colors.grey,
    ));

    for (int index = 0; index < list.length; index++) {
      Color clr = Colors.white;
      if (list[index].location != "Online(Teams)") {
        clr = Color(0xffcdd3e5);//Theme.of(context).cardColor;
      }
      res.add(
          GestureDetector(
            onTap: () {
              currentLesson = list[index];
              Navigator.of(context).restorablePush(_pairDialogBuilder);
              },
            child: Container(
            margin: EdgeInsets.only(top: 10, left: 5, right: 5),
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                color: clr,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: clr,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, spreadRadius: 2),
                    ],
                  ),
                  child: ListTile(
                    leading: Text(
                      list[index].time,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        17 > list[index].title.length
                            ? list[index].title
                            : list[index].title.substring(0, 17) + "...",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    subtitle: Text(
                      list[index].location,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ))),
      ));
    }
    return res;
  }
}

Lesson? currentLesson;

Route<Object?> _pairDialogBuilder(
      BuildContext context, Object? arguments) {
      return RawDialogRoute<void>(
        pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            ) {
              var title = currentLesson?.title ?? "...";
              var time = currentLesson?.time ?? "......";
              var teacher = currentLesson?.teacher.name ?? "...";
              var place = currentLesson?.location ?? "...";

              var label = TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600);
              var value = TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600);

              return SimpleDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                  title: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,

                    ),
                  ),
                  children: <Widget>[
                    SimpleDialogOption(
                      child: Row(
                                children: [
                                  Text("Время начала:", style: label),
                                  Spacer(),
                                  Text(time.substring(0, time.length ~/ 2), style: value),
                                ],
                              ),
                      ),
                    SimpleDialogOption(
                      child: Row(
                        children: [
                          Text("Время конца:", style: label),
                          Spacer(),
                          Text(time.substring(time.length ~/ 2, time.length), style: value),
                        ],
                      ),
                    ),

                    SimpleDialogOption(
                      child: Text("Преподаватель:", style: label),
                    ),

                    SimpleDialogOption(
                      child: Text(teacher, style: value),
                    ),

                    SimpleDialogOption(
                      child: Text("Место проведения:", style: label),
                    ),

                    SimpleDialogOption(
                      child: Text(place, style: value),
                    ),
                  ],
              );
              },
      );

}