part of 'timetable_page_bloc.dart';

@immutable
abstract class TimetablePageState {}

class TimetablePageInitial extends TimetablePageState {}

class TimetablePageLoading extends TimetablePageState {}

class TimetablePageLoaded extends TimetablePageState {
  final Schedule schedule;

  TimetablePageLoaded(this.schedule);
}

class TimeTableUpperWeek extends TimetablePageState {}

class TimeTableLowerWeek extends TimetablePageState {}

class TimetablePageFail extends TimetablePageState {}
