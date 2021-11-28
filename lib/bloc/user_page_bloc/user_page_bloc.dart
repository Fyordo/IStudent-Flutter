import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_page_event.dart';
part 'user_page_state.dart';

class UserPageBloc extends Bloc<UserPageEvent, UserPageState> {
 UserPageBloc() : super(UserPageInitial());

  @override
  Stream<UserPageState> mapEventToState(
    UserPageEvent event,
  ) async* {
     if (event is UserPageLoadEvent) {
       
      yield UserPageLoading();
    }
    
  }
}
