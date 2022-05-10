part of 'header_bloc.dart';

@immutable
abstract class HeaderState {}

class HeaderStateWithStudent extends HeaderState {
  final Student student;

  HeaderStateWithStudent({required this.student});
}

class HeaderStateWithoutStudent extends HeaderState {}
