import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/IStudent.dart';
import '../../../../data/NewsMMCS.dart';

part 'mmcs_news_event.dart';
part 'mmcs_news_state.dart';

class NewsMmcsBloc extends Bloc<NewsMmcsEvent, NewsMmcsState> {
  NewsMmcsBloc() : super(NewsMmcsStateWithoutNews());

  @override
  Stream<NewsMmcsState> mapEventToState(NewsMmcsEvent event) async* {
    if (event is NewsMmcsEventWithNews) {
      yield NewsMmcsStateWithoutNews();
      List<NewsMMCS> news_mmcs = await IStudent.getNewsMMCS();
      yield NewsMmcsStateWithNews(news_mmcs: news_mmcs);
    }
  }
}
