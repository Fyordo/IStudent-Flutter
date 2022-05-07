part of 'tutors_page_bloc.dart';

@immutable
abstract class TutorsPageState {}

class TutorsPageInitial extends TutorsPageState {}

class TutorsPageLoading extends TutorsPageState {}

class TutorsPageLoaded extends TutorsPageState {
  final List<Teacher> teachers;

  TutorsPageLoaded(this.teachers);
}