part of 'refresher_bloc.dart';

@immutable
abstract class RefresherState {}

class RefreshInitial extends RefresherState {}
class RefreshState extends RefresherState {}
