part of 'group_bloc.dart';

@immutable
abstract class GroupState {}

class GroupStateWithData extends GroupState {
  final Group group;

  GroupStateWithData({required this.group});
}

class GroupStateWithoutData extends GroupState {}
