import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_student/bloc/home_page_bloc/home_page_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

late bool profileFlag;
late bool lectionsFlag;
late bool newsFlag;
late bool lectorFlag;
 @override
  void initState() {
    super.initState();
    profileFlag = false;
    lectionsFlag = false;
    newsFlag = false;
    lectorFlag = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomePageBloc, HomePageState>(listener: (c, state) {
       
        if (state is  HomePageUserInfoLoaded) {
          if (1==1) {
            //Constants.isInSystem = true;
            
          } else {
           // Constants.isInSystem = true;
           
          }
        }

        //*/
      }, builder: (context, state) {
        if (state is !HomePageLoading) {
          return Center(
              child: CupertinoActivityIndicator());
        } else {
          return Column(
            
            children: [ Container(
                        width: double.infinity,
                        height: 150,
                        child: Card(
                          margin: EdgeInsets.only(top: 0, left: 0, right: 0),
                          
                          color: Colors.amberAccent,
                        ))],
            
            );
        }
      }),
    );
  }
}
