part of 'user_bloc.dart';

abstract class UserState {
  const UserState();
}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {}

class UserNoInternetState extends UserState {}

class UserNotAccessState extends UserState {}

class UserWrongAuthState extends UserState {
  final message;

  const UserWrongAuthState(this.message);
}
