part of 'tutors_bloc.dart';

@immutable
abstract class TutorsState {}

class TutorsStateWithTutors extends TutorsState {
  final List<Teacher> teachers;

  TutorsStateWithTutors({required this.teachers});
}

class TutorsStateWithoutTutors extends TutorsState {}
