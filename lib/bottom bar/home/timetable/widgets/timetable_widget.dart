import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:io';

class Timetable extends StatefulWidget {
const Timetable({ Key? key }) : super(key: key);

@override
_TimetableState createState() => _TimetableState();
}



class _TimetableState extends State<Timetable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstructDay(context, "ПОНЕДЕЛЬНИК"),
        ConstructDay(context, "ВТОРНИК"),
        ConstructDay(context, "СРЕДА"),
        ConstructDay(context, "ЧЕТВЕРГ"),
        ConstructDay(context, "ПЯТНИЦА"),
        ConstructDay(context, "СУББОТА"),
    ]
    );
  }
}

Column ConstructDay(BuildContext context, String day) {
  return Column(
    children: [
      Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                day,
                style: TextStyle(
                    color: Theme
                        .of(context)
                        .hintColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              )
    ),

Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    height: 150.0,
    child: ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) => Container(
        width: 300,
        height: 150,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 5, bottom: 10),
                          child: Text(
                            'Предмет',
                            style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          )),

                      Card(
                        color: Theme.of(context).secondaryHeaderColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'XX:XX - XX:XX',
                              style: TextStyle(
                                  color: Theme.of(context).cardColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),

                      Container(
                          margin: EdgeInsets.only(left: 5, top: 5),
                          child: Text(
                            'Дополнительная информация',
                            style: TextStyle(
                                color: Theme.of(context).highlightColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ),
  ],
  );
}