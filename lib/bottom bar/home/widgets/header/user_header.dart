import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:i_student/bottom%20bar/home/bloc/header/header_bloc.dart';
import 'package:i_student/data/IStudent.dart';

import '../../../../data/Student.dart';

class UserHeader extends StatelessWidget {
  
  String avatar;
  UserHeader(this.avatar);
  @override
  Widget build(BuildContext context) {
    String token = Hive.box('tokenbox').get('token');
    print("Token в user_header: " + token);
    return BlocProvider<HeaderBloc>(
      create: (context) {
        return HeaderBloc(HeaderStateWithoutStudent())
          ..add(HeaderEventWithStudent(token: token));
      },
      child: BlocConsumer<HeaderBloc, HeaderState>(
        listener: (context, state) {
          if (state is HeaderStateWithStudent){
            print(state.student);
          }
        },
        builder: (context, state) {
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
                            child: avatar != ''
                                ? Image.network(
                              avatar,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                    'assets/images/user_without_photo.png');
                              },
                            )
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
                      children:[

                        //Text("Екатерина Смирнова",style: TextStyle(color: Theme.of(context).hintColor, fontSize: 18, fontWeight: FontWeight.w400)),
                        Text(state is HeaderStateWithStudent ? state.student.name : "ERROR BLYAT",style: TextStyle(color: Theme.of(context).hintColor, fontSize: 18, fontWeight: FontWeight.w400)),
                        SizedBox(height: 5),
                        Text("Курс 1 Группа 2", style: TextStyle(color: Theme.of(context).highlightColor),)

                      ])
                ]),
              ));
        },
      ),
    );
  }
}