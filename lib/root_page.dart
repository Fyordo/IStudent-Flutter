import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_student/screens/welcome_screen.dart';


import 'bloc/user_bloc/user_bloc.dart';
import 'bloc/memory_bloc/memory_bloc.dart';
import 'my_home_page.dart';

class RootPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MemoryBloc, MemoryState>(
        listener: (context, state) {
        if (state is MemoryEmptyState) {
            //Constants.isInSystem = true;
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) =>  WelcomeScreen(),
              ),
                  (route) => false,
            );
            // Constants.isInSystem = true;

        }
        if (state is MemoryPresentState) {
          //Constants.isInSystem = true;
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  MyHomePage(0),
            ),
                (route) => false,
          );
        }
      },
          builder: (context, state) {
            if (state is MemoryInitial) {
              return Center(
                  child: CupertinoActivityIndicator());
            } else {
              return Center();
            }
          }),
    );
  }
}


/*class RootPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserBloc, UserState>(listener: (context, state) {
        print("State in Consumer");
        print(BlocProvider.of<UserBloc>(context).hashCode);
        //print(state.toString());
        if (state is UserNotAccessState) {
            //Constants.isInSystem = true;
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) =>  WelcomeScreen(),
              ),
                  (route) => false,
            );
            // Constants.isInSystem = true;

        }


        if (state is UserLoadedState) {
          print("Мы здесь?");
          //Constants.isInSystem = true;
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  MyHomePage(0),
            ),
                (route) => false,
          );
        }

      }, builder: (context, state) {
        if (state is UserLoadingState) {
          return Center(
              child: CupertinoActivityIndicator());
        } else {
          return Center();
        }
      }),
    );
  }
}*/
