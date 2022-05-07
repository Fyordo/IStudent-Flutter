import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/IStudent.dart';
import '../../data/Student.dart';

part 'user_page_event.dart';
part 'user_page_state.dart';

class UserPageBloc extends Bloc<UserPageEvent, UserPageState> {
  UserPageBloc() : super(UserPageStateWithoutStudent());

  @override
  Stream<UserPageState> mapEventToState(UserPageEvent event) async* {
    if (event is UserPageEventWithStudent) {
      yield UserPageStateWithoutStudent();
      Student student = await IStudent.getStudent(event.token);
      yield UserPageStateWithStudent(student: student);
    }
  }
}
