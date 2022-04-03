import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:i_student/data/IStudent.dart';
import 'package:i_student/data/Schedule.dart';
import 'package:meta/meta.dart';

part 'timetable_page_event.dart';
part 'timetable_page_state.dart';

class TimetablePageBloc extends Bloc<TimetablePageEvent, TimetablePageState> {
  TimetablePageBloc() : super(TimetablePageInitial());

  @override
  Stream<TimetablePageState> mapEventToState(
    TimetablePageEvent event,
  ) async* {
    if (event is TimetablePageLoadEvent) {
      Schedule schedule =
          await IStudent.getSchedule(Hive.box('tokenbox').get('token'));
      yield TimetablePageLoaded(schedule);
    }
  }
}
