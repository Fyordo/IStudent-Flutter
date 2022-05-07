part of 'header_lectures_bloc.dart';

@immutable
abstract class HeaderLecturesEvent {}

class HeaderLecturesEventWithData extends HeaderLecturesEvent {
  final String token;

  HeaderLecturesEventWithData({required this.token}) {
    //print(token);
  }
}

class HeaderLecturesEventWithoutData extends HeaderLecturesEvent {}
