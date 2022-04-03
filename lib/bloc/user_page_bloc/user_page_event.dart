part of 'user_page_bloc.dart';

@immutable
abstract class UserPageEvent {}

class UserPageEventWithStudent extends UserPageEvent {
  final String token;
  UserPageEventWithStudent({required this.token}){
    //print(token);
  }
}

class UserPageEventWithoutStudent extends UserPageEvent{

}