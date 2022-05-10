part of 'group_bloc.dart';

@immutable
abstract class GroupEvent {}

class GroupEventWithData extends GroupEvent {
  final String token;

  GroupEventWithData({required this.token}) {
    //print(token);
  }
}

class GroupEventWithoutData extends GroupEvent {}
