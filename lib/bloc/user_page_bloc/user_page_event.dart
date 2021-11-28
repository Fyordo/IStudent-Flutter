part of 'user_page_bloc.dart';

@immutable
abstract class UserPageEvent {}

class UserPageLoadEvent extends UserPageEvent{

}

class UserPageUserInfoLoaded extends UserPageState {}
class UserPageUserInfoErr extends UserPageState {}