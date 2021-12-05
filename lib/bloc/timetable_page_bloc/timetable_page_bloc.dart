import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timetable_page_event.dart';
part 'timetable_page_state.dart';

class TimetablePageBloc extends Bloc<TimetablePageEvent, TimetablePageState> {
  TimetablePageBloc() : super(TimetablePageInitial());

  @override
  Stream<TimetablePageState> mapEventToState(
      TimetablePageEvent event,
  ) async* {
     if (event is TimetablePageLoadEvent) {
       
      yield TimetablePageLoading();
    }
    
  }
}
