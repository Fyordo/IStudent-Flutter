import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:i_student/data/Student.dart';
import 'package:meta/meta.dart';

import '../../../../data/IStudent.dart';

part 'header_event.dart';
part 'header_state.dart';

class HeaderBloc extends Bloc<HeaderEvent, HeaderState> {
  HeaderBloc()
      : super(HeaderStateWithoutStudent());

  @override
  Stream<HeaderState> mapEventToState(HeaderEvent event) async* {
    if (event is HeaderEventWithStudent) {
      yield HeaderStateWithoutStudent();
      Student student = await IStudent.getStudent(event.token);
      yield HeaderStateWithStudent(student: student);
    }
  }
}
