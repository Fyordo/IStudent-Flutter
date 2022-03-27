part of 'internet_bloc.dart';

@immutable
abstract class InternetState {}

class ConnectionInitial extends InternetState {}

class ConnectionSuccess extends InternetState {}

class ConnectionFailure extends InternetState {}
