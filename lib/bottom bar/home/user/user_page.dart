import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:i_student/bloc/user_page_bloc/user_page_bloc.dart';

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
    print("Token в user_page: " + token);
    return BlocProvider<UserPageBloc>(
      create: (context) {
        return UserPageBloc(UserPageStateWithoutStudent())
          ..add(UserPageEventWithStudent(token: token));
      },
      child: Scaffold(
        body: BlocConsumer<UserPageBloc, UserPageState>(
          listener: (context, state) {
            if (state is UserPageStateWithStudent) {
              print(state.student);
            }
            if(!(state is UserPageStateWithStudent) && !(state is UserPageStateWithoutStudent))
              {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error")));

              }

          },
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
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text('Logout')));
                                      IStudent.logOut(
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
                          Container(
                            decoration: BoxDecoration(
                              border: Border.symmetric(
                                  vertical: BorderSide(width: 0.3)),
                            ),
                            child: Material(
                              child: ListTile(
                                title: Text("Фамилия",
                                    style: TextStyle(
                                        color: Colors.black26, fontSize: 15)),
                                subtitle: Text(state.student.getLastName(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17)),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.symmetric(
                                  vertical: BorderSide(width: 0.3)),
                            ),
                            child: Material(
                              child: ListTile(
                                title: Text("Имя",
                                    style: TextStyle(
                                        color: Colors.black26, fontSize: 15)),
                                subtitle: Text(state.student.getFirstName(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17)),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.symmetric(
                                  vertical: BorderSide(width: 0.3)),
                            ),
                            child: Material(
                              child: ListTile(
                                title: Text("e-mail",
                                    style: TextStyle(
                                        color: Colors.black26, fontSize: 15)),
                                subtitle: Text(state.student.email,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17)),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.symmetric(
                                  vertical: BorderSide(width: 0.3)),
                            ),
                            child: Material(
                              child: ListTile(
                                title: Text("Группа",
                                    style: TextStyle(
                                        color: Colors.black26, fontSize: 15)),
                                subtitle: Text(
                                    state.student.group.getGroupTitle(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else if (state is UserPageStateWithoutStudent) {
              return Center(
                  child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
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



*/
