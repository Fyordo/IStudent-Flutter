import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:i_student/bloc/timetable_page_bloc/timetable_page_bloc.dart';

import '../timetable/widgets/timetable_widget.dart';

class TimetablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Расписание",
          style: TextStyle(
              fontSize: 25,
              color: Colors.black
          ),
        ),
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
                      tileMode: TileMode.repeated, // repeats the gradient over the canvas
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Timetable(state.schedule)
                      ],
                    ),
                  )
              );
            }
            else return Text(state.toString());
          }
        ),
    );
  }
}
