part of 'vk_news_bloc.dart';

@immutable
abstract class NewsVkEvent {}

class NewsVkEventWithNews extends NewsVkEvent {
  NewsVkEventWithNews() {}
}

class NewsVkEventWithoutNews extends NewsVkEvent {}
