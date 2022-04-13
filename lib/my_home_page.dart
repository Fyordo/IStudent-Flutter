import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_student/bottom%20bar/groups/group_list.dart';
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
      GroupList(),
      BlocProvider(
          create: (context) =>
              TimetablePageBloc()..add(new TimetableBuildWeekEvent(WeekType.current)),//TimetablePageLoadEvent()
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
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: SizedBox(
              height: 54,
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
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
                    icon: Constants.svgScheduleIcon,
                    activeIcon: Constants.svgScheduleIconActive,
                    label: '',
                  ),
                ],
                onTap: (index) => setState(() {
                  widget._currentIndex = index;
                }),
              )),
        ),
      ),
    );
  }
}
