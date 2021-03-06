import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:i_student/bloc/user_page_bloc/user_page_bloc.dart';

import 'dart:convert';

import '../../../data/IStudent.dart';
import '../../../screens/welcome_screen.dart';

class UserPage extends StatefulWidget {
  UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String token = Hive.box('tokenbox').get('token');
    return BlocProvider<UserPageBloc>(
      create: (context) {
        return UserPageBloc()
          ..add(UserPageEventWithStudent(token: token));
      },
      child: Scaffold(
        body: BlocBuilder<UserPageBloc, UserPageState>(
          builder: (context, state) {
            if (state is UserPageStateWithStudent) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Theme.of(context).bottomAppBarColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppBar(
                            title: Text(
                                'Личный кабинет',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            centerTitle: true,
                            backgroundColor: Colors.white,
                            actions: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(right: 15.0),
                                  child: InkWell(
                                    onTap: () async {
                                      Flushbar(
                                        message: "Удаляем ваши данные из памяти устройства...",
                                        backgroundColor: Theme.of(context).primaryColor,
                                        showProgressIndicator: true,
                                      ).show(context);
                                      await IStudent.logOut(
                                          Hive.box('tokenbox').get('token'));
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WelcomeScreen()));
                                    },
                                    child: Icon(
                                      Icons.logout,
                                      size: 26.0,
                                      color: Colors.black,
                                    ),
                                  )),
                            ],
                          ),

                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row (
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black)
                                            ),
                                            width: MediaQuery.of(context).size.width * 0.4,
                                            height: MediaQuery.of(context).size.width * 0.4,
                                            child: Image.memory(Base64Decoder()
                                                .convert(state.student.photo)
                                            )
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.1,
                                      ),
                                      Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget> [
                                            Text(state.student.getLastName(),
                                              style: TextStyle(
                                                fontSize: 30,
                                              ),

                                            ),
                                            Text(state.student.getFirstName(),
                                              style: TextStyle(
                                                fontSize: 30,
                                              ),
                                            ),
                                            Text(state.student.group.getGroupTitle(),
                                              style: TextStyle(
                                                fontSize: 30,
                                              ),
                                            ),
                                          ]
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ),

                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        Clipboard.setData(ClipboardData(text: state.student.email));
                                        await Flushbar(
                                            message: "Скопировано в буфер обмена",
                                            duration: Duration(seconds: 3),
                                        backgroundColor: Theme.of(context).primaryColor,
                                        ).show(context);
                                        },
                                      child: Text(state.student.email),
                                      style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        elevation: 15.0,
                                      ),
                                    ),
                                  ),

                                  Row(
                                    children: [
                                      Spacer(),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        child: ElevatedButton(
                                          onPressed: () {IStudent.launchURL("https://grade.sfedu.ru");},
                                          child: Text("Оценки"),
                                          style: ElevatedButton.styleFrom(
                                            primary: Theme.of(context).primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(25),
                                            ),
                                            elevation: 15.0,
                                          ),
                                        ),
                                      ),

                                      Spacer(),

                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        child: ElevatedButton(
                                          onPressed: () {IStudent.launchURL("https://sfedu.ru/www/stat_pages15.show?p=LKS/profil/D");},
                                          child: Text("ЛК ЮФУ"),
                                          style: ElevatedButton.styleFrom(
                                            primary: Theme.of(context).primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(25),
                                            ),
                                            elevation: 15.0,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),

                                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                                ],
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else if (state is UserPageStateWithoutStudent) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Theme.of(context).bottomAppBarColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppBar(
                            title: Text('Личный кабинет',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            centerTitle: true,
                            backgroundColor: Colors.white,
                            actions: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(right: 15.0),
                                  child: InkWell(
                                    onTap: () async {
                                      Flushbar(
                                        message: "Удаляем ваши данные из памяти устройства...",
                                        backgroundColor: Theme.of(context).primaryColor,
                                        showProgressIndicator: true,
                                      ).show(context);
                                      await IStudent.logOut(
                                          Hive.box('tokenbox').get('token'));
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WelcomeScreen()));
                                    },
                                    child: Icon(
                                      Icons.logout,
                                      size: 26.0,
                                      color: Colors.black,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                    ),
                    Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ))
                  ],
                ),
              );
            } else
              return Text("Error");
          },
        ),
      ),
    );
  }
}