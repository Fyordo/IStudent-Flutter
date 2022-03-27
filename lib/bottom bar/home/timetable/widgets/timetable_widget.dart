import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:i_student/provider/theme_provider/theme_provider.dart';
import 'dart:io';
import 'package:i_student/data/Schedule.dart';
import 'package:i_student/data/Lesson.dart';
//import '../../../../data/structures.dart';

class Timetable extends StatelessWidget {
  Schedule schedule;
  Timetable(this.schedule);

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 400.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) => Container(
          width: 300,
          height: 150,
          child: ConstructDay(context, schedule[index]),//ConstructDay(context, days[index]),
        ),
      ),
    );

  }
}

Column ConstructDay(BuildContext context, List<Lesson> list) {
  return Column(
      children: [
        Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "Day_name",
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
              color: MyThemes.lightTheme.primaryColor,
              child: ListTile(
                leading: Text(
                  list[index].time,
                  style: TextStyle(color: Colors.white),
                ),
                title: Text(list[index].title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                subtitle: Text(list[index].location,
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
