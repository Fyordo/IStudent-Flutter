import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:i_student/bottom%20bar/home/bloc/header/header_bloc.dart';
import 'package:i_student/bloc/refresher_bloc/refresher_bloc.dart';

class UserHeader extends StatelessWidget {
  /*String avatar;
  UserHeader(this.avatar);*/
  @override
  Widget build(BuildContext context) {
    String token = Hive.box('tokenbox').get('token');
    return BlocProvider<HeaderBloc>(
      create: (context) {
        return HeaderBloc()
          ..add(HeaderEventWithStudent(token: token));
      },
      child: BlocListener<RefresherBloc, RefresherState>(
        listener: (context, state) {
          if (state is RefreshState) {
            BlocProvider.of<HeaderBloc>(context).add(HeaderEventWithStudent(token: token));
          }
        },
        child: BlocBuilder<HeaderBloc, HeaderState>(
          builder: (context, state) {
            if (state is HeaderStateWithStudent) {
              return Container(
                  width: double.infinity,
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25)),
                    ),
                    child: Row(children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: CircleAvatar(
                          radius: 36,
                          child: ClipOval(
                              child: new SizedBox(
                                  width: 70.0,
                                  height: 70.0,
                                  child: Image.memory(Base64Decoder()
                                      .convert(state.student.photo))
                                  //),
                                  //
                                  )),
                          backgroundColor: Colors.black,
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  state.student.name,
                                  style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Курс " +
                                  state.student.group.group_course.toString() +
                                  " Группа " +
                                  state.student.group.group_number.toString(),
                              style: TextStyle(
                                  color: Theme.of(context).highlightColor),
                            )
                          ])
                    ]),
                  ));
            } else if (state is HeaderStateWithoutStudent) {
              return Container(
                  width: double.infinity,
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25)),
                    ),
                    child: Row(children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: CircleAvatar(
                          radius: 45,
                          child: ClipOval(
                              child: new SizedBox(
                            width: 70.0,
                            height: 70.0,
                            child: Image.asset(
                              'assets/images/user_without_photo.png',
                              fit: BoxFit.fill,
                            ),
                            //),
                            //
                          )),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Загрузка...",
                                style: TextStyle(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(height: 5),
                            Text(
                              "Курс ?? Группа ??",
                              style: TextStyle(
                                  color: Theme.of(context).highlightColor),
                            )
                          ])
                    ]),
                  ));
            } else
              return Text("Error");
          },
        ),
      ),
    );
  }
}

/*
Container(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25)),
                  ),

                  child: Row(children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: CircleAvatar(
                        radius: 45,
                        child: ClipOval(
                            child: new SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: state is HeaderStateWithStudent
                                  ? Image.memory(
                                  Base64Decoder().convert(state.student.photo))
                                  : Image.asset(
                                'assets/images/user_without_photo.png',
                                fit: BoxFit.fill,
                              ),
                              //),
                              //
                            )),
                        backgroundColor: Colors.transparent,
                      ),
                    ),

                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(state is HeaderStateWithStudent ? state.student
                              .name : "Загрузка...", style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .hintColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400)),
                          SizedBox(height: 5),
                          Text(state is HeaderStateWithStudent ? "Курс " +
                              state.student.group.group_course.toString() +
                              " Группа " + state.student.group.group_number
                              .toString() : "Курс 1 Группа 2", style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .highlightColor),)

                        ])
                  ]),
                ));
 */
