import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:i_student/data/AllLectures.dart';
import 'package:i_student/data/Lecture.dart';
import 'lectures_list.dart';

class LecturesWidget extends StatefulWidget {
  late List<String> categories;
  late HashMap<String, List<Lecture>> lectures;
  late HashMap<String, int> offsets;
  LecturesWidget(AllLectures allLectures) {
    categories = allLectures.Categories;
    lectures = allLectures.Lectures;
    offsets = allLectures.Offsets;
  }

  @override
  _LecturesWidgetState createState() => _LecturesWidgetState();
}

class _LecturesWidgetState extends State<LecturesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: DefaultTabController(
      length: widget.categories.length,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Ваши пары'.toUpperCase(),
                    style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 25, left: 10, right: 10),
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ]),
            child: TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              indicatorColor: Theme.of(context).secondaryHeaderColor,
              tabs:
                  List<Widget>.generate(widget.categories.length, (int index) {
                return new Tab(
                  text: widget.categories[index],
                );
              }),
            ),
          ),
          SizedBox(
            height: 236,
            child: TabBarView(
              children:
                  List<Widget>.generate(widget.categories.length, (int index) {
                return LecturesList(widget.lectures[widget.categories[index]] ?? [], widget.offsets[widget.categories[index]] ?? 0);
              }),
            ),
          )
        ],
      ),
    ));
  }
}
