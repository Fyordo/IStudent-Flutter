import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_student/provider/theme_provider/theme_provider.dart';
import 'package:i_student/root_page.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'bloc/user_bloc/user_bloc.dart';
import 'data/IStudent.dart';

var box;

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tokenbox');
  print('lf');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) =>
    UserBloc()..add(UserInitialEvent()),//UserInitialEvent()
      child: MaterialApp(
      //color: Colors.white,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light, //ThemeMode.system
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,

      home: RootPage()),//RootPage('auto'))
    );
  }
}

