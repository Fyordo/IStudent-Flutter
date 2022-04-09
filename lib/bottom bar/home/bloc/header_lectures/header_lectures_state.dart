part of 'header_lectures_bloc.dart';

@immutable
abstract class HeaderLecturesState {}

class HeaderLecturesStateWithData extends HeaderLecturesState {
  final List<Lesson> lessons;

  HeaderLecturesStateWithData({required this.lessons});
}

class HeaderLecturesStateWithoutData extends HeaderLecturesState {}
