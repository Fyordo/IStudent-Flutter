import 'package:flutter/material.dart';



import 'lesson_table_list.dart';
import 'user_header.dart';

class HeaderHomePage extends StatefulWidget {
  const HeaderHomePage({ Key? key }) : super(key: key);

  @override
  _HeaderHomePageState createState() => _HeaderHomePageState();
}

class _HeaderHomePageState extends State<HeaderHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserHeader(''),
                      LessonsTableList(),
                      
                    ],
                  ),
                );
  }
}