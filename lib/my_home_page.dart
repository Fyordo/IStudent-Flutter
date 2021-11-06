import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_student/constants.dart';


import 'bloc/user_bloc/user_bloc.dart';


class MyHomePage extends StatefulWidget {
 
  List<Widget> screens = [];
  int _currentIndex;
  MyHomePage(this._currentIndex) {
    screens = [Scaffold(body: Text('ddd2')),Scaffold(body: Text('ddd2')), Scaffold(body: Text('ddd2')),];
  }
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  bool dialogshown = false;

  //final tabs =
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: IndexedStack(
          index: widget._currentIndex,
          children: widget.screens,
        ),
        bottomNavigationBar:FloatingNavbar(
          backgroundColor: Theme.of(context).bottomAppBarColor,
          selectedBackgroundColor: Colors.grey[200],
          selectedItemColor: Colors.grey[850],
          unselectedItemColor: Colors.grey[200],
          
          //` showSelectedLabels: false,
          // showUnselectedLabels: false,
          currentIndex: widget._currentIndex,
          //type: BottomNavigationBarType.fixed,
          items: [
             FloatingNavbarItem(
               icon: Icons.home,
              //customWidget: Constants.svgHomeIcon,
              //activeIcon: Constants.svgHomeIconActive,
              //title: Padding(padding: EdgeInsets.all(0)),
            ),
             FloatingNavbarItem(
              //customWidget: Constants.svgCameraIcon,
               icon: Icons.chat_bubble_rounded,
              //activeIcon: Constants.svgCameraIconActive,
              //title: Padding(padding: EdgeInsets.all(0)),
            ),
             FloatingNavbarItem(
                icon: Icons.notifications,
              //customWidget: Constants.svgProfileIcon,
              //1activeIcon: Constants.svgProfileIconActive,
              //title: Padding(padding: EdgeInsets.all(0)),
            ),
          ],
          onTap: (index) => setState(() {
            widget._currentIndex = index;
          }),
        ),
      );
    
  }
}
