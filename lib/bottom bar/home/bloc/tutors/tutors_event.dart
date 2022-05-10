part of 'tutors_bloc.dart';

@immutable
abstract class TutorsEvent {}

class TutorsEventWithTutors extends TutorsEvent {
  final String token;

  TutorsEventWithTutors({required this.token}) {
    //print(token);
  }
}

class TutorsEventWithoutTutors extends TutorsEvent {}
