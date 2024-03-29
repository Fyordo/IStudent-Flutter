import 'dart:ui';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_student/data/IStudent.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:i_student/data/Lecture.dart';
import 'package:i_student/bloc/lectures_bloc/lectures_bloc.dart';

import 'dart:async';

class LecturesList extends StatelessWidget {
  final List<Lecture> lectures;
  final int offset;

  LecturesList(this.lectures, this.offset);

  @override
  Widget build(BuildContext context) {
    ScrollController controller =
        ScrollController(initialScrollOffset: 370.0 * offset);

    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      height: 150.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemCount: lectures.length,
        itemBuilder: (BuildContext context, int index) => Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          width: 360,
          child: GestureDetector(
            onTap: () async {
              bool f = await showAdditionsDialogue(context, lectures[index]);
              if (f) {
                BlocProvider.of<LecturesBloc>(context).add(LecturesLoadEvent());
              }
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 5, bottom: 10),
                        child: Text(
                          'Пара от ${lectures[index].strdate}',
                          style: TextStyle(
                              color: Theme.of(context).hintColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 5, bottom: 10),
                        child: Text(
                          'Время: ${lectures[index].time}',
                          style: TextStyle(
                              color: Theme.of(context).highlightColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 5, top: 5),
                        child: Text(
                          'Преподаватель: ',
                          style: TextStyle(
                              color: Theme.of(context).highlightColor,
                              fontSize: 15,
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
                            lectures[index].teacher.length != 0
                                ? lectures[index].teacher
                                : 'Не указан',
                            style: TextStyle(
                                color: Theme.of(context).cardColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 5, top: 5),
                        child: Text(
                          'Дополнения:',
                          style: TextStyle(
                              color: Theme.of(context).highlightColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )),
                    lectures[index].addictions.length == 0
                        ? Card(
                            color: Theme.of(context).secondaryHeaderColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Дополнений нет...',
                                  style: TextStyle(
                                      color: Theme.of(context).cardColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )),
                          )
                        : Card(
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  lectures[index].addictions[0].description,
                                  style: TextStyle(
                                      color: Theme.of(context).cardColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Future<bool> showAdditionsDialogue(BuildContext context, Lecture lecture) async {
    final _controller = TextEditingController();

    bool res = false;
    await showBarModalBottomSheet(
        context: context,
        builder: (_) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: Container(
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      backgroundColor: Theme.of(context).primaryColor,
                      automaticallyImplyLeading: false,
                      title: Text("Дополнения"),
                      centerTitle: true,
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextFormField(
                              controller: _controller,
                              decoration: const InputDecoration(
                                hintText: 'Введите дополнение',
                              ),
                              onFieldSubmitted: (String? value) async {
                                res = await sendAddition(value, context, lecture);
                              },
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            String? value = _controller.text;
                            res = await sendAddition(value, context, lecture);
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: lecture.addictions.length,
                      itemBuilder: (BuildContext context, int index) => Column(
                        children: [
                          ListTile(
                            onTap: () async {
                              Clipboard.setData(ClipboardData(
                                  text: lecture.addictions[index].description));
                              await Flushbar(
                                message:
                                    "Дополнение скопировано в буфер обмена",
                                duration: Duration(seconds: 3),
                                backgroundColor: Theme.of(context).primaryColor,
                              ).show(context);
                            },
                            title: Text(lecture.addictions[index].description),
                            leading: IconButton(
                              onPressed: () async {
                                res = await deleteAddition(context, lecture.addictions[index].id);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ),
                          Divider()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });

    return res;
  }

  static Future<bool> sendAddition(String? value, context, lecture) async {
    if (value != null && value.isNotEmpty) {
      String token = await Hive.box('tokenbox').get('token');
      String res = await IStudent.sendAddition(token, lecture, value);

      await Flushbar(
        duration: Duration(seconds: 2),
        flushbarPosition: FlushbarPosition.TOP,
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        backgroundColor:
            res == 'Дополнение успешно сохранено' ? Colors.green : Colors.red,
        message: res,
      ).show(context);

      if (res == 'Дополнение успешно сохранено') {
        Navigator.pop(context);
        return true;
      }
    }

    return false;
  }

  static Future<bool> deleteAddition(context, id) async {
    String token = await Hive.box('tokenbox').get('token');
    String res = await IStudent.deleteAddition(token, id);

    await Flushbar(
      duration: Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.TOP,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      backgroundColor:
          res == 'Дополнение успешно удалено!' ? Colors.green : Colors.red,
      message: res,
    ).show(context);
    if (res == 'Дополнение успешно удалено!') {
      Navigator.pop(context);
      return true;
    }

    return false;
  }
}
