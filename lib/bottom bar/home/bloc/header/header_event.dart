part of 'header_bloc.dart';

@immutable
abstract class HeaderEvent {}

class HeaderEventWithStudent extends HeaderEvent {
  final String token;

  HeaderEventWithStudent({required this.token}) {}
}

class HeaderEventWithoutStudent extends HeaderEvent {}
