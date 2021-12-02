import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_student/bottom%20bar/chats/chats_list.dart';
import 'package:i_student/constants.dart';

import 'bloc/home_page_bloc/home_page_bloc.dart';
import 'bloc/user_bloc/user_bloc.dart';
import 'bottom bar/home/home_page.dart';

import 'bloc/user_page_bloc/user_page_bloc.dart';
import 'bottom bar/home/user/user_page.dart';


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
          create: (context) => UserPageBloc()..add(new UserPageLoadEvent()),
          child:
          //search
          UserPage()),
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
        bottomNavigationBar: BottomNavigationBar(
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
              icon: Constants.svgChatIcon,
              activeIcon: Constants.svgChatIconActive,
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Constants.svgProfileIcon,
              activeIcon: Constants.svgProfileIconActive,
              label: '',
            ),
          ],
          onTap: (index) => setState(() {
            widget._currentIndex = index;
          }),
        ),
      ),
    );
  }
}
