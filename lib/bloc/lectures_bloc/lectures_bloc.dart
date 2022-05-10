import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:i_student/data/IStudent.dart';
import 'package:i_student/data/AllLectures.dart';

part 'lectures_event.dart';
part 'lectures_state.dart';

class LecturesBloc extends Bloc<LecturesEvent, LecturesState> {
  LecturesBloc() : super(LecturesInitial());

  @override
  Stream<LecturesState> mapEventToState(
      LecturesEvent event,
      ) async* {
    if (event is LecturesLoadEvent) {

      yield LecturesLoading();

      AllLectures allLectures = await IStudent.getAllLectures(Hive.box('tokenbox').get('token'));

      yield LecturesLoaded(allLectures);
    }


  }
}
