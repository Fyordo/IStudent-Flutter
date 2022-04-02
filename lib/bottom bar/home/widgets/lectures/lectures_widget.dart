import 'package:flutter/material.dart';

import 'lectures_list.dart';


class LecturesWidget extends StatefulWidget {
  List<String> categories = [
    "Алгебра и геометрия",
    "Непрерывная математика",
    "Вычислительная математикика",
    "Математичесткая Логика",
    "Физкультура",
    "Экономика",
    "Право",
  ];
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
                     child: Text('Ваши лекции'.toUpperCase(),  style: TextStyle(color: Theme.of(context).hintColor,
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
                      print(widget.categories[0]);
                      return new Tab(
                        text: widget.categories[index],
                      );
                    }),
                  ),
                ),
                SizedBox(
                    height: 210,
                    child: TabBarView(
                      children:
                          List<Widget>.generate(widget.categories.length, (int index) {
                        return LecturesList();
                      }),
                    ),
                  )
              ],
            ),
          )
    );
  }
}
