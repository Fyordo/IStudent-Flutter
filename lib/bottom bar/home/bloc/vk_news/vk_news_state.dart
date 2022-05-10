part of 'vk_news_bloc.dart';

@immutable
abstract class NewsVkState {}

class NewsVkStateWithNews extends NewsVkState {
  final List<NewsVK> news_vk;

  NewsVkStateWithNews({required this.news_vk});
}

class NewsVkStateWithoutNews extends NewsVkState {}
