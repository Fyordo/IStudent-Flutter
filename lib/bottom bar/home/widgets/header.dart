import 'package:flutter/material.dart';


import 'head_lessons.dart';
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
                  color: Theme.of(context).bottomAppBarColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderHomeScreen(''),
                      HeadLessons(),
                    ],
                  ),
                );
  }
}