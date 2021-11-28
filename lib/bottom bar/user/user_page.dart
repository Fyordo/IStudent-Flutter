import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:i_student/bloc/home_page_bloc/home_page_bloc.dart';
import 'package:i_student/bloc/user_page_bloc/user_page_bloc.dart';

import '../user/widgets/user_widget.dart';

class UserPage extends StatefulWidget {
  UserPage({Key? key}) : super(key: key);
  String avatar = '';
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserPageBloc, UserPageState>(listener: (c, state) {
        if (state is UserPageUserInfoLoaded) {
          if (1 == 1) {
            //Constants.isInSystem = true;

          } else {
            // Constants.isInSystem = true;

          }
        }

        //*/
      }, builder: (context, state) {
        if (state is! UserPageLoading) {
          return Center(child: CupertinoActivityIndicator());
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
               UserHomePage()
              ],
            ),
          );
        }
      }),
    );
  }
}
