import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_student/bloc/user_page_bloc/user_page_bloc.dart';
import 'package:i_student/bottom%20bar/home/user/user_page.dart';

import 'lesson_table_list.dart';
import 'user_header.dart';

class HeaderHomePage extends StatefulWidget {
  const HeaderHomePage({Key? key}) : super(key: key);

  @override
  _HeaderHomePageState createState() => _HeaderHomePageState();
}

class _HeaderHomePageState extends State<HeaderHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => BlocProvider(
                        create: (context) =>
                        UserPageBloc()..add(new UserPageLoadEvent()),
                        child:
                        //search
                        UserPage()),
                  ),
                );
              },
              child: UserHeader()
            ),/*UserHeader('')*/
            LessonsTableList(),
          ],
        ),
      );
  }
}
