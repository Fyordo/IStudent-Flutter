import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:i_student/data/IStudent.dart';
import 'package:i_student/provider/theme_provider/theme_provider.dart';
import 'package:i_student/root_page.dart';
import 'package:i_student/data/Teacher.dart';
import 'package:i_student/data/Lesson.dart';
import 'package:i_student/data/Schedule.dart';

import 'bloc/internet_bloc/internet_bloc.dart';
import 'bloc/memory_bloc/memory_bloc.dart';
import 'bloc/user_bloc/user_bloc.dart';

bool checkToken = false;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TeacherAdapter());
  Hive.registerAdapter(LessonAdapter());
  Hive.registerAdapter(ScheduleAdapter());
  await Hive.openBox('tokenbox');
  await Hive.openBox('schedulebox');
  checkToken = await checkMemory();
  runApp(MyApp());
}



Future<bool> checkMemory() async {
  if (Hive.box('tokenbox').isEmpty) return false;

  bool check = await IStudent.checkToken(Hive.box('tokenbox').get("token"));
  if (!check) {
    return false;
  }

  return true;
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetBloc>(
            create: (context) => InternetBloc()..add(ListenConnection())),
        BlocProvider<UserBloc>(
            create: (context) => UserBloc()..add(UserInitialEvent())),
        BlocProvider<MemoryBloc>(
            create: (context) => MemoryBloc()
              ..add(checkToken ? MemoryPresentEvent() : MemoryEmptyEvent())),
      ],
      child: MaterialApp(
          //color: Colors.white,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          //ThemeMode.system
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: RootPage()),
    );
  }
}
