import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:i_student/bloc/tutorspage_bloc/tutors_page_bloc.dart';
import 'package:i_student/bottom%20bar/home/bloc/tutors/tutors_bloc.dart';

class TutorsPage extends StatefulWidget {
  const TutorsPage({Key? key}) : super(key: key);

  @override
  _TutorsPageState createState() => _TutorsPageState();
}

class _TutorsPageState extends State<TutorsPage> {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<TutorsPageBloc, TutorsPageState>(
      builder: (context, state) {
        if (state is TutorsPageLoaded) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Text(
                    "Преподаватели",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  )
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: ListView.separated(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: state.teachers.length,
                    itemBuilder: (BuildContext context, int index) => ListTile(
                        leading: CircleAvatar(
                            backgroundColor:
                            Theme.of(context).secondaryHeaderColor,
                            radius: 30,
                            child: ClipOval(
                                child: Image.memory(Base64Decoder()
                                    .convert(state.teachers[index].photo)))),
                        title: Text(state.teachers[index].name),
                        subtitle: Text(
                          state.teachers[index].degree,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          height: 1,
                          color: Theme.of(context).hintColor,
                        ),
                  )),
            ),
          );
        } else if (state is TutorsStateWithoutTutors) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Text(
                    "Загрузка преподавателей...",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  )
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  child: ListView.separated(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) => ListTile(
                        leading: CircleAvatar(
                            backgroundColor:
                            Theme.of(context).secondaryHeaderColor,
                            radius: 30,
                            child: ClipOval(
                                child: Image.asset(
                                  'assets/images/user_without_photo.png',
                                  fit: BoxFit.fill,
                                ))),
                        title: Text("Загрузка..."),
                        subtitle: Row(
                          children: [
                            Text(
                              "Загрузка...",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            )
                          ],
                        )),
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          height: 1,
                          color: Theme.of(context).hintColor,
                        ),
                  )),
            ),
          );
        } else
          return Text("Error");
      },
    );
  }
}
