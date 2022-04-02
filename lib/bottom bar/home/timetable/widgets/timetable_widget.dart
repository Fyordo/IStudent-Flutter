import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:i_student/provider/theme_provider/theme_provider.dart';
import 'dart:io';
import 'package:i_student/data/Schedule.dart';
import 'package:i_student/data/Lesson.dart';
//import '../../../../data/structures.dart';

const List<String> dayNames = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"];
class Timetable extends StatelessWidget {
  final Schedule schedule;
  Timetable(this.schedule);

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: 8,
      ),
      height: MediaQuery.of(context).size.height-10,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) => Container(
          width: 300,
          height: 150,
          child: ConstructDay(dayNames[index], schedule[index]),
        ),
      ),
    );

  }
}

class ConstructDay extends StatelessWidget {
final String dayName;
final List<Lesson> list;
ConstructDay(this.dayName,this.list);

Widget build(BuildContext context) {
  return Column(
      children: [
        Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              dayName,
              style: TextStyle(
                  color: Theme
                      .of(context).hintColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            )
        ),

        ListView.builder(
          itemCount: list.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              //color: MyThemes.lightTheme.primaryColor,
              color: Color(0xffcdd3e5),
              child: ListTile(
                leading: Text(
                  list[index].time,
                  style: TextStyle(color: Colors.white),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(list[index].title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                subtitle: Text(list[index].location,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),

              ),
            );
          },
        )
      ]
  );
}
}

/*Column ConstructDay(BuildContext context, Day day) {
  return Column(
      children: [
        Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              day.name,
              style: TextStyle(
                  color: Theme
                      .of(context).hintColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            )
        ),

        ListView.builder(
          itemCount: day.count,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              color: MyThemes.lightTheme.primaryColor,
                child: ListTile(
              leading: Text(
                  day.lessons[index].time,
                  style: TextStyle(color: Colors.white),
              ),
              title: Text(day.lessons[index].name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Text(day.lessons[index].place,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),

            ),
              );
          },
        )
      ]
  );
}*/
