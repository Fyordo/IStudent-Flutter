import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_student/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:i_student/bottom%20bar/home/widgets/lectures/lectures_widget.dart';

import 'package:i_student/bottom%20bar/home/widgets/news/news.dart';



import 'widgets/header/header.dart';
import 'widgets/header/user_header.dart';
import 'widgets/tutors/tutors.dart';

class HomePage extends StatefulWidget {
 
  @override
  _HomePageState createState() => _HomePageState();
  List<Tab> d = [];
  // ignore: non_constant_identifier_names
  List<String> categories = [
    "algem",
    "nepra",
    "matlogika",
    "vichmat",
    "fizra",
    "economica",
    "pravo",
    "h"
  ];
}

class _HomePageState extends State<HomePage> {
  late bool profileFlag;
  late bool lectionsFlag;
  late bool newsFlag;
  late bool lectorFlag;
  @override
  void initState() {
    super.initState();
    profileFlag = false;
    lectionsFlag = false;
    newsFlag = false;
    lectorFlag = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomePageBloc, HomePageState>(listener: (c, state) {
        if (state is HomePageUserInfoLoaded) {
          if (1 == 1) {
            //Constants.isInSystem = true;

          } else {
            // Constants.isInSystem = true;

          }
        }

        //*/
      }, builder: (context, state) {
        if (state is HomePageLoading) {
          return SingleChildScrollView(
            child: Column(
              children: [
                HeaderHomePage(),
                LecturesWidget(),
                Tutors(),
                News()
              ],
            ),
          );
        } else {
          return Center(child: CupertinoActivityIndicator());
        }
      }),
    );
  }
}
