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

      yield TimetablePageLoading();

      bool isUpWeek = await IStudent.upWeek(Hive.box('tokenbox').get('token'));
      await Hive.box('schedulebox').put('isUpWeek', isUpWeek);
      await Hive.box('schedulebox').put('lastLoadTime', DateTime.now());

      Schedule upper_schedule = await IStudent.getSchedule(Hive.box('tokenbox').get('token'), true);
      await Hive.box('schedulebox').put('upper_schedule', upper_schedule);

      Schedule lower_schedule = await IStudent.getSchedule(Hive.box('tokenbox').get('token'), false);
      await Hive.box('schedulebox').put('lower_schedule', lower_schedule);

      yield TimetablePageLoaded(isUpWeek? upper_schedule : lower_schedule);
    }

    if (event is TimetableBuildWeekEvent) {
      if (!Hive.box('schedulebox').containsKey('isUpWeek') || !Hive.box('schedulebox').containsKey('isUpWeek')) {
        yield TimetablePageFail();
      }
      else {
        Schedule schedule;
        switch (event.weekType) {
          case WeekType.current:
            bool isUpWeek = await Hive.box('schedulebox').get("isUpWeek");

            DateTime lastLoadTime = await Hive.box('schedulebox').get("lastLoadTime");
            DateTime nowTime = DateTime.now();
            int weekDif = (nowTime.difference(lastLoadTime).inDays + lastLoadTime.weekday - nowTime.weekday) ~/ 7;

            if (weekDif % 2 != 0) {
              isUpWeek = !isUpWeek;
            }

            schedule = await Hive.box('schedulebox').get(
                isUpWeek ? "upper_schedule" : "lower_schedule");
            break;
          case WeekType.upper:
            schedule = await Hive.box('schedulebox').get("upper_schedule");
            break;
          case WeekType.lower:
            schedule = await Hive.box('schedulebox').get("lower_schedule");
            break;
        }

        yield TimetablePageLoaded(schedule);
      }
    }


  }
}
