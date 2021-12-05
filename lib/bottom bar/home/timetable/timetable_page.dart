import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'package:i_student/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:i_student/bloc/timetable_page_bloc/timetable_page_bloc.dart';

import '../timetable/widgets/timetable_widget.dart';

class TimetablePage extends StatefulWidget {
  TimetablePage({Key? key}) : super(key: key);
  @override
  _TimetablePageState createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColor,
        title: Text("Расписание", style: TextStyle(fontSize: 25),
        ),
      ),
      body: BlocConsumer<TimetablePageBloc, TimetablePageState>(listener: (c, state) {
        if (state is TimetablePageUserInfoLoaded) {
          if (1 == 1) {
            //Constants.isInSystem = true;

          } else {
            // Constants.isInSystem = true;

          }
        }


      }, builder: (context, state) {
        if (state is! TimetablePageLoading) {
          return Center(child: CupertinoActivityIndicator());
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Timetable()
              ],
            ),
          );
        }
      }),
    );
  }
}
