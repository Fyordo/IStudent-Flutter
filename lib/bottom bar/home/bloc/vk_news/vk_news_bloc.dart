import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'vk_news_event.dart';
part 'vk_news_state.dart';

class VkNewsBloc extends Bloc<VkNewsEvent, VkNewsState> {
  VkNewsBloc() : super(VkNewsInitial()) {
    on<VkNewsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
