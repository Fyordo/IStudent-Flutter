part of 'tutors_bloc.dart';

@immutable
abstract class TutorsEvent {}

class TutorsEventWithTutors extends TutorsEvent {
  final String token;

  TutorsEventWithTutors({required this.token}) {}
}

class TutorsEventWithoutTutors extends TutorsEvent {}
