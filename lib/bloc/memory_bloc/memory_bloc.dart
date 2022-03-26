import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'memory_event.dart';
part 'memory_state.dart';

class MemoryBloc extends Bloc<MemoryEvent, MemoryState> {
  MemoryBloc() : super(MemoryInitial());

  @override
  Stream<MemoryState> mapEventToState(
      MemoryEvent event,
      ) async* {
    if (event is MemoryEmptyEvent) {
      //yield UserLoadingState();
      yield MemoryEmptyState();
    }

    if (event is MemoryPresentEvent) {
      yield MemoryPresentState();
    }


  }
}
