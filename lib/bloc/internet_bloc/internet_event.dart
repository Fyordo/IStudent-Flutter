part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent {}

class ListenConnection extends InternetEvent {}

class ConnectionChanged extends InternetEvent {
  InternetState connection;

  ConnectionChanged(this.connection);
}
