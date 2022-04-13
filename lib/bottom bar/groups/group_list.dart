import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../bloc/group_bloc/group_bloc.dart';

class GroupList extends StatefulWidget {
  const GroupList({Key? key}) : super(key: key);

  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  @override
  Widget build(BuildContext context) {
    String token = Hive.box('tokenbox').get('token');

    return BlocProvider<GroupBloc>(
      create: (context) {
        return GroupBloc(GroupStateWithoutData())
          ..add(GroupEventWithData(token: token));
      },
      child: BlocConsumer<GroupBloc, GroupState>(
        listener: (context, state) {
          if (state is GroupStateWithData) {
            print(state.group);
          }
        },
        builder: (context, state) {
          if (state is GroupStateWithData) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Row(
                  children: [
                    Text(
                      "Группа ${state.group.getGroupTitle()}",
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
                      itemCount: state.group.students.length,
                      itemBuilder: (BuildContext context, int index) =>
                          ListTile(
                              leading: CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).secondaryHeaderColor,
                                  radius: 30,
                                  child: ClipOval(
                                      child: Image.memory(Base64Decoder()
                                          .convert(state.group.students[index].photo)))),
                              title: Text(state.group.students[index].name),
                              subtitle: Row(
                                children: [
                                  Text(
                                    state.group.students[index].email,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  state.group.students[index].is_headman
                                      ? Text(" (Староста)",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            color: Colors.red
                                          ))
                                      : Text("",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600))
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
          } else if (state is GroupStateWithoutData) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Row(
                  children: [
                    Text(
                      "Загрузка группы...",
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
                      itemBuilder: (BuildContext context, int index) =>
                          ListTile(
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
                                    style:
                                    TextStyle(fontWeight: FontWeight.w600),
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
      ),
    );
  }
}
