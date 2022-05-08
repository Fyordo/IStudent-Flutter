import 'package:bloc/bloc.dart';
import 'package:i_student/data/IStudent.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserNotAccessState());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserLoadEvent) {
      yield UserLoadingState();
      String res = await IStudent.logIn(event.login, event.password);

      if (res == "Ok") {
        yield UserLoadedState();
      } else
        yield UserWrongAuthState(res);
    }

    if (event is UserInitialEvent) {
      yield new UserNotAccessState();
    }
  }
}
