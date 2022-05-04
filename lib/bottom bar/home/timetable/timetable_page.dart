import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_student/bloc/internet_bloc/internet_bloc.dart';
import 'package:i_student/bloc/timetable_page_bloc/timetable_page_bloc.dart';

import 'package:another_flushbar/flushbar.dart';

import '../timetable/widgets/timetable_widget.dart';

class TimetablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: PopupMenuButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
            ),
            offset: Offset(0, 30),
            onSelected: (res) {
              BlocProvider.of<TimetablePageBloc>(context)
                  .add(TimetableBuildWeekEvent(res as WeekType));
            },
            child: Row(
              children: [
                Text(
                  "Расписание",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black)
              ],
            ),
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("Текущая"),
                    value: WeekType.current,
                  ),
                  PopupMenuItem(
                    child: Text("Верхняя"),
                    value: WeekType.upper,
                  ),
                  PopupMenuItem(
                    child: Text("Нижняя"),
                    value: WeekType.lower,
                  )
                ]),
        actions: [
          IconButton(
              onPressed: () async {
                if (BlocProvider.of<InternetBloc>(context).state is ConnectionFailure) {
                    await Flushbar(
                    title: 'Ошибка',
                    message:
                    'Нет подключения к интернету',
                    duration: Duration(seconds: 3),
                    backgroundColor: Theme.of(context).primaryColor,
                  ).show(context);
                }
                else BlocProvider.of<TimetablePageBloc>(context)
                    .add(TimetablePageLoadEvent());
              },
              icon: Icon(Icons.update, color: Colors.black))
        ],
      ),
      body: BlocBuilder<TimetablePageBloc, TimetablePageState>(
          builder: (context, state) {
        if (state is TimetablePageLoaded) {
          return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0x2b7b3a99),
                    Color(0x2b3a5199)
                  ], // red to yellow
                  tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [Timetable(state.schedule)],
                ),
              ));
        } else if (state is TimetablePageFail) {
          return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0x2b7b3a99),
                    Color(0x2b3a5199)
                  ], // red to yellow
                  tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
              child: Center(
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Похоже в памяти устройства нет расписания. Попробуйте загрузить его, нажав кнопку в верхнем правом углу экрана.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ))));
        }
        else if (state is TimetablePageLoading)
          return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ));
        else
          return Center(
              child: Text("Неизвестная ошибка"));
      }),
    );
  }
}
