import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/IStudent.dart';
import '../../../../data/Teacher.dart';

part 'tutors_event.dart';
part 'tutors_state.dart';

class TutorsBloc extends Bloc<TutorsEvent, TutorsState> {
  TutorsBloc(TutorsState tutorsStateWithoutTutors)
      : super(tutorsStateWithoutTutors);

  @override
  Stream<TutorsState> mapEventToState(TutorsEvent event) async* {
    if (event is TutorsEventWithTutors) {
      List<Teacher> teachers = await IStudent.getTeachers(event.token);
      yield TutorsStateWithTutors(teachers: teachers);
    }
  }
}
