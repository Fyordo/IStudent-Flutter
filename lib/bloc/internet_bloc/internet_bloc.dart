import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc() : super(ConnectionInitial());

  late StreamSubscription<InternetConnectionStatus> listener;

  @override
  Stream<InternetState> mapEventToState(InternetEvent event) async* {
    if (event is ListenConnection) {
      listener = InternetConnectionChecker().onStatusChange.listen(
        (InternetConnectionStatus status) {
          add(ConnectionChanged(status == InternetConnectionStatus.disconnected
              ? ConnectionFailure()
              : ConnectionSuccess()));
        },
      );
    }
    if (event is ConnectionChanged) yield event.connection;
  }

  @override
  Future<void> close() {
    listener.cancel();
    return super.close();
  }
}
