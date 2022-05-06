import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:i_student/bottom%20bar/home/bloc/tutors/tutors_bloc.dart';

import 'package:i_student/bloc/refresher_bloc/refresher_bloc.dart';

class TutorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String token = Hive.box('tokenbox').get('token');

    String avatar = 'assets/images/user_without_photo.png';

    return BlocProvider<TutorsBloc>(
      create: (context) {
        return TutorsBloc()
          ..add(TutorsEventWithTutors(token: token));
      },

      child: BlocListener<RefresherBloc, RefresherState>(
        listener: (context, state) {
          if (state is RefreshState) {
            BlocProvider.of<TutorsBloc>(context)
                .add(TutorsEventWithTutors(token: token));
          }
        },

        child: BlocConsumer<TutorsBloc, TutorsState>(
          listener: (context, state) {
            if (state is TutorsStateWithTutors) {
              //print(state.teachers);
            }
          },
          builder: (context, state) {
            if (state is TutorsStateWithTutors) {
              return Container(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                height: 170.0,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.teachers.length,
                  itemBuilder: (BuildContext context, int index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    width: 300,
                    height: 150,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                child: new SizedBox(
                                    width: 100.0,
                                    height: 180.0,
                                    child: state.teachers[index].photo != ""
                                        ? Image.memory(
                                            Base64Decoder().convert(
                                                state.teachers[index].photo),
                                            fit: BoxFit.cover,
                                          )
                                        : Image.network(
                                            avatar,
                                            fit: BoxFit.fill,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                  'assets/images/user_without_photo.png');
                                            },
                                          ))),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(
                                      state.teachers[index].name,
                                      style: TextStyle(
                                          color: Theme.of(context).hintColor,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else if (state is TutorsStateWithoutTutors) {
              return Column(
                children: [
                  Container(
                    height: 20,
                  ),
                  Text("Загрузка виджета преподавателей..."),
                  Container(
                    height: 20,
                  ),
                  CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                  Container(
                    height: 20,
                  ),
                ],
              );
            } else
              return Text("Error");
          },
        ),
      ),
    );
  }
}
