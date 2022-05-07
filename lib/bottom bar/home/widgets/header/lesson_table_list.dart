import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:i_student/data/Lesson.dart';

import '../../bloc/header_lectures/header_lectures_bloc.dart';
import 'package:i_student/bloc/refresher_bloc/refresher_bloc.dart';

class LessonsTableList extends StatelessWidget {
  const LessonsTableList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String token = Hive.box('tokenbox').get('token');

    return BlocProvider<HeaderLecturesBloc>(
      create: (context) {
        return HeaderLecturesBloc()
          ..add(HeaderLecturesEventWithData(token: token));
      },
      child: BlocListener<RefresherBloc, RefresherState>(
        listener: (context, state) {
          if (state is RefreshState) {
            BlocProvider.of<HeaderLecturesBloc>(context).add(HeaderLecturesEventWithData(token: token));
          }
        },
        child: BlocBuilder<HeaderLecturesBloc, HeaderLecturesState>(
          builder: (context, state) {
            if (state is HeaderLecturesStateWithData) {
              double mainHeight = 170.0;
              List<int> cardsWithAddictions = [];
              double bigCardHeight = 10;

              int ind = 0;
              for (Lesson lesson in state.lessons) {
                if (lesson.addictions.length > 0) {
                  mainHeight = 200.0;
                  cardsWithAddictions.add(ind);
                  bigCardHeight = 40;
                }
                ind++;
              }

              return Container(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 0,
                ),
                height: mainHeight,
                child: Container(
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.lessons.length,
                    itemBuilder: (BuildContext context, int index) => Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        bottom: cardsWithAddictions.contains(index)
                            ? 10
                            : bigCardHeight,
                        left: 5,
                        right: 5,
                      ),
                      width: 300,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 5, bottom: 10),
                                  height: 23,
                                  child: Text(
                                    state.lessons[index].title,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  )),
                              Card(
                                color: Theme.of(context).secondaryHeaderColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Container(
                                    height: 20,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "Ведёт: ${state.lessons[index].teacher.name}",
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: Theme.of(context).cardColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 5, top: 10),
                                  child: Text(
                                    'Проходит в: ${(state.lessons[index].location == "" ? "<не указано>" : state.lessons[index].location)}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Theme.of(context).highlightColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  child: Text(
                                    'Время: ${state.lessons[index].start()} - ${state.lessons[index].end()}',
                                    style: TextStyle(
                                        color: Theme.of(context).highlightColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  )),
                              cardsWithAddictions.contains(index)
                                  ? Card(
                                      margin: EdgeInsets.only(left: 5, top: 10),
                                      color:
                                          //Theme.of(context).secondaryHeaderColor,
                                          Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      child: Container(
                                          height: 20,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            state.lessons[index].addictions[0]
                                                .description,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color:
                                                    Theme.of(context).cardColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          )),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else if (state is HeaderLecturesStateWithoutData) {
              return Column(
                children: [
                  Container(
                    height: 20,
                  ),
                  Text(
                    "Загрузка виджета расписания на сегодня...",
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    height: 20,
                  ),
                  CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  Container(
                    height: 20,
                  ),
                ],
              );
            } else
              return Text("Error");
          },
        ),
      ),
    );
  }
}
