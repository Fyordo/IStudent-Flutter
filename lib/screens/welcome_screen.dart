import 'package:flutter/material.dart';
import 'package:i_student/screens/sign_in.dart';
import 'package:i_student/data/IStudent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc/user_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              height: 200,
              child: Image.asset("assets/images/i_student_logo.png")),
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 40),
              child: Text(
                "Добро пожаловать!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black),
              ),
              
            ),
            Container(
              width: double.infinity,
              
              margin: EdgeInsets.symmetric(horizontal: 20,),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                onPressed: () => IStudent.launchAuth(),
                child: Text("Создать аккаунт",
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                    
              ),
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20,),
                child: FlatButton(
                  onPressed: () => {
                    Navigator.push(context,
                  MaterialPageRoute(
                  builder: (context) => SignIn(),)
                  ),
                  },
                  child: Text('У меня уже есть аккаунт',
                      style: TextStyle(color:  Theme.of(context).primaryColor, fontSize: 15)),
                  
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color:  Theme.of(context).primaryColor,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(8)),
                ))
          ],
        ),
      ),
    );
  }
}
