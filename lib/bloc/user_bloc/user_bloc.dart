import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
 UserBloc() : super(UserNotAccesState());
     @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
     if (event is UserLoadEvent) {
      yield UserLoadedState();
    }

     if (event is UserInitialEvent) {
       yield UserNotAccesState();
     }

  }
}
