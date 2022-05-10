import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:i_student/data/Group.dart';
import 'package:meta/meta.dart';

import '../../data/IStudent.dart';
import '../../data/Student.dart';

part 'group_event.dart';
part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  GroupBloc(GroupState tutorsStateWithoutData)
      : super(tutorsStateWithoutData);

  @override
  Stream<GroupState> mapEventToState(GroupEvent event) async* {
    if (event is GroupEventWithData) {
      Group group = await IStudent.getGroup(event.token);
      List<Student> students = await IStudent.getGroupStudents(event.token);
      group.setStudents(students);
      yield GroupStateWithData(group: group);
    }
  }
}
