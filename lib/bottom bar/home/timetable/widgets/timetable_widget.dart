import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:i_student/provider/theme_provider/theme_provider.dart';
import 'dart:io';

import 'timetable_support.dart';

class Timetable extends StatefulWidget {
const Timetable({ Key? key }) : super(key: key);

@override
_TimetableState createState() => _TimetableState();
}



class _TimetableState extends State<Timetable> {
  @override
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
          child: ConstructDay(context, days[index]),
        ),
      ),
    );

  }
}

Column ConstructDay(BuildContext context, Day day) {
  return Column(
      children: [
        Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              day.name,
              style: TextStyle(
                  color: Theme
                      .of(context)
                      .hintColor,
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
              leading: Text(day.lessons[index].time),
              title: Text(day.lessons[index].name,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Text(day.lessons[index].place,
                style: TextStyle(
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
