import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:i_student/bloc/timetable_page_bloc/timetable_page_bloc.dart';

import '../timetable/widgets/timetable_widget.dart';

class TimetablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColor,
        title: Text("Расписание", style: TextStyle(fontSize: 25),
        ),
      ),
      body: BlocBuilder<TimetablePageBloc, TimetablePageState>(
          builder: (context, state) {
            if (state is TimetablePageLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Timetable(state.schedule)
                  ],
                ),
              );
            }


            else return Text(state.toString());
          }
        ),
    );
  }
}
