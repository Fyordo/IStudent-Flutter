part of 'mmcs_news_bloc.dart';

@immutable
abstract class NewsMmcsEvent {}

class NewsMmcsEventWithNews extends NewsMmcsEvent{
  NewsMmcsEventWithNews(){
  }
}

class NewsMmcsEventWithoutNews extends NewsMmcsEvent{

}