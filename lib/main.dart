import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_student/provider/theme_provider/theme_provider.dart';
import 'package:i_student/root_page.dart';

import 'bloc/user_bloc/user_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //color: Colors.white,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light, //ThemeMode.system
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,

      home: BlocProvider(
          create: (context) =>
              UserBloc()..add(new UserInitialEvent()),//UserBloc()..add(new UserLoadEvent()),
          child:
              //search
              RootPage('auto')),
    );
  }
}
