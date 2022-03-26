part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserLoadEvent extends UserEvent {
  final login;
  final password;

  UserLoadEvent(this.login, this.password);
}

class UserInitialEvent extends UserEvent {}
