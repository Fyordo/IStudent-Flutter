part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserLoadEvent extends UserEvent {}

class UserInitialEvent extends UserEvent {}
