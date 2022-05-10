import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:i_student/data/IStudent.dart';
import 'package:i_student/data/Teacher.dart';
part 'tutors_page_event.dart';
part 'tutors_page_state.dart';

class TutorsPageBloc extends Bloc<TutorsPageEvent, TutorsPageState> {
  TutorsPageBloc() : super(TutorsPageInitial());

  @override
  Stream<TutorsPageState> mapEventToState(
      TutorsPageEvent event,
      ) async* {
    if (event is TutorsPageLoadEvent ) {

      yield TutorsPageLoading();

      String token = await Hive.box('tokenbox').get('token');
      List<Teacher> teachers = await IStudent.getAllTeachers(token);
      yield TutorsPageLoaded(teachers);
    }


  }
}
