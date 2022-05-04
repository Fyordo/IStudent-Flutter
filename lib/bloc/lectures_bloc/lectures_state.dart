part of 'lectures_bloc.dart';

@immutable
abstract class LecturesState {}

class LecturesInitial extends LecturesState {}

class LecturesLoading extends LecturesState {}

class LecturesLoaded extends LecturesState {
  AllLectures allLectures;

  LecturesLoaded(this.allLectures);
}