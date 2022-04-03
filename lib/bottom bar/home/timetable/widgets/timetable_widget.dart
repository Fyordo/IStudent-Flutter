import 'package:flutter/material.dart';
import 'package:i_student/data/Lesson.dart';
import 'package:i_student/data/Schedule.dart';
//import '../../../../data/structures.dart';

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
          top: 20,
          bottom: 20,
          left: 0,
        ),
        height: MediaQuery.of(context).size.height - 200,
        child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) => Container(
              margin: EdgeInsets.only(
                top: 10,
                left: 8,
                right: 8,
              ),
              width: 350,
              child: Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10),
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 20),
          child: Text(
            dayName,
            style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 22,
                fontWeight: FontWeight.w600),
          )),
      const Divider(
        height: 20,
        thickness: 2,
        indent: 10,
        endIndent: 10,
        color: Colors.grey,
      ),
      ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          Color clr = Colors.white;
          if (list[index].location != "Online(Teams)") {
            clr = Color(0xffcdd3e5);
          }
          return Container(
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
                  )));
        },
      )
    ]);
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
