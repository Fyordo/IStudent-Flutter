import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:i_student/data/Lesson.dart';
import 'package:meta/meta.dart';

import '../../../../data/IStudent.dart';

part 'header_lectures_event.dart';
part 'header_lectures_state.dart';

class HeaderLecturesBloc extends Bloc<HeaderLecturesEvent, HeaderLecturesState> {
  HeaderLecturesBloc() : super(HeaderLecturesStateWithoutData());

  @override
  Stream<HeaderLecturesState> mapEventToState(HeaderLecturesEvent event) async* {
    if (event is HeaderLecturesEventWithData) {
      yield HeaderLecturesStateWithoutData();
      List<Lesson> lessons = await IStudent.getTodaySchedule(event.token);
      yield HeaderLecturesStateWithData(lessons: lessons);
    }
  }
}
