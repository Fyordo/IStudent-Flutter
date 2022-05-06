import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/IStudent.dart';
import '../../../../data/NewsVK.dart';

part 'vk_news_event.dart';
part 'vk_news_state.dart';

class NewsVkBloc extends Bloc<NewsVkEvent, NewsVkState> {
  NewsVkBloc() : super(NewsVkStateWithoutNews());

  @override
  Stream<NewsVkState> mapEventToState(NewsVkEvent event) async* {
    if (event is NewsVkEventWithNews) {
      yield NewsVkStateWithoutNews();
      List<NewsVK> news_vk = await IStudent.getNewsVK();
      yield NewsVkStateWithNews(news_vk: news_vk);
    }
  }
}
