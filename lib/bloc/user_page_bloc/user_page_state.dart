part of 'user_page_bloc.dart';

@immutable
abstract class UserPageState {}

class UserPageStateWithStudent extends UserPageState {
  final Student student;

  UserPageStateWithStudent({required this.student});
}

class UserPageStateWithoutStudent extends UserPageState {}
