import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'refresher_event.dart';
part 'refresher_state.dart';

class RefresherBloc extends Bloc<RefresherEvent, RefresherState> {
  RefresherBloc() : super(RefreshInitial());

  @override
  Stream<RefresherState> mapEventToState(
      RefresherEvent event,
      ) async* {
    if (event is RefreshEvent) {
      //yield UserLoadingState();
      yield RefreshState();
    }
  }
}
