import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_student/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:i_student/bloc/lectures_bloc/lectures_bloc.dart';
import 'package:i_student/bloc/refresher_bloc/refresher_bloc.dart';
import 'package:i_student/bottom%20bar/home/widgets/lectures/lectures_widget.dart';
import 'package:i_student/bottom%20bar/home/widgets/news_mmcs/news_mmcs.dart';
import 'package:i_student/bottom%20bar/home/widgets/news_vk/news_vk.dart';

import 'widgets/header/header.dart';
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
    return BlocProvider(
      create: (context) => RefresherBloc(),
      child: Scaffold(
        body: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
          if (state is HomePageLoading) {
            return RefreshIndicator(
              color: Theme.of(context).primaryColor,
              child: Container(
                color: Colors.grey[100],
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HeaderHomePage(),

                      BlocProvider(
                        create: (context) =>
                            LecturesBloc()..add(LecturesLoadEvent()),
                        child: BlocListener<RefresherBloc, RefresherState>(
                          listener: (context, state) {
                            if (state is RefreshState) {
                              BlocProvider.of<LecturesBloc>(context)
                                  .add(LecturesLoadEvent());
                            }
                          },
                          child: BlocBuilder<LecturesBloc, LecturesState>(
                            builder: (context, state) {
                              if (state is LecturesLoaded) {
                                return LecturesWidget(state.allLectures);
                              }

                              if (state is LecturesLoading) {
                                return Column(
                                  children: [
                                    Container(
                                      height: 20,
                                    ),
                                    Text("Загрузка виджета лекций..."),
                                    Container(
                                      height: 20,
                                    ),
                                    CircularProgressIndicator(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Container(
                                      height: 20,
                                    ),
                                  ],
                                );
                              }

                              return Text("Неизвестная ошибка");
                            },
                          ),
                        ),
                      ),
                      Tutors(),
                      NewsMmcs(),
                      const Divider(
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.black,
                      ),
                      NewsVk(),
                    ],
                  ),
                ),
              ),
              onRefresh: () async {
                BlocProvider.of<RefresherBloc>(context).add(RefreshEvent());
              },
            );
          } else {
            return Center(child: CupertinoActivityIndicator());
          }
        }),
      ),
    );
  }
}
