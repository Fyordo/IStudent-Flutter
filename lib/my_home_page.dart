import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_student/bottom%20bar/chats/chats_list.dart';
import 'package:i_student/constants.dart';

import 'bloc/home_page_bloc/home_page_bloc.dart';
import 'bloc/timetable_page_bloc/timetable_page_bloc.dart';
import 'bottom bar/home/home_page.dart';
import 'bottom bar/home/timetable/timetable_page.dart';

class MyHomePage extends StatefulWidget {
  List<Widget> screens = [];
  int _currentIndex;

  MyHomePage(this._currentIndex) {
    screens = [
      BlocProvider(
          create: (context) => HomePageBloc()..add(new HomePageLoadEvent()),
          child:
              //search
              HomePage()),
      ChatsList(),
      BlocProvider(
          create: (context) =>
              TimetablePageBloc()..add(new TimetablePageLoadEvent()),
          child: TimetablePage()),
    ];
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool dialogshown = false;

  //final tabs =
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: widget._currentIndex,
          children: widget.screens,
        ),
        bottomNavigationBar: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            backgroundColor: Colors.grey[300],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: widget._currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Constants.svgHomeIcon,
                activeIcon: Constants.svgHomeIconActive,
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Constants.svgGroupIcon,
                activeIcon: Constants.svgGroupIconActive,
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Constants.svgFeedIcon,
                activeIcon: Constants.svgFeedIconActive,
                label: '',
              ),
            ],
            onTap: (index) => setState(() {
              widget._currentIndex = index;
            }),
          )
        ),
      ),
    );
  }
}
