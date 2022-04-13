part of 'timetable_page_bloc.dart';

@immutable
abstract class TimetablePageEvent {}
class TimetablePageStartEvent extends TimetablePageEvent {}

class TimetablePageLoadEvent extends TimetablePageEvent {}

enum WeekType {current, lower,upper}
class TimetableBuildWeekEvent extends TimetablePageEvent {
  final WeekType weekType;

  TimetableBuildWeekEvent(this.weekType);
}

class TimetablePageFailEvent extends TimetablePageEvent {}