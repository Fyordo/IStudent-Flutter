import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:i_student/data/IStudent.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
 UserBloc() : super(UserNotAccessState());

     @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
     if (event is UserLoadEvent) {
       //yield UserLoadingState();
       await IStudent.logIn(event.login, event.password);
       yield new UserLoadedState();
    }

     if (event is UserInitialEvent) {
       yield new UserNotAccessState();
     }


  }
}

//UserBloc userBloc = UserBloc();
