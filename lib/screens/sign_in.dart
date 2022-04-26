import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:i_student/data/IStudent.dart';
import 'package:i_student/my_home_page.dart';
import 'package:i_student/screens/welcome_screen.dart';
import 'package:i_student/widgets/custom_password_field.dart';
import 'package:i_student/widgets/custom_text_field.dart';

import '../bloc/user_bloc/user_bloc.dart';
import '../constants.dart';

class SignIn extends StatefulWidget {
  static String myassetMailName = 'assets/images/mail_icon.svg';
  static String myassetEyeName = 'assets/images/eye_icon.svg';
  bool isObscure = true;
  CustomTextField email = CustomTextField(
    'Введите почту...',
    Constants.mailIcon,
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    'Неверный формат почты',
    0,
    '',
    prefixText: 'E-mail   ',
  );

  CustomPasswordField password = CustomPasswordField(
    "Введите пароль...",
    r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$",
    prefixText: 'Пароль',
  );

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Widget mailIcon = SvgPicture.asset(SignIn.myassetMailName,
      color: Colors.grey[600], height: 2, width: 2);

  final Widget eyeIcon = SvgPicture.asset(SignIn.myassetEyeName,
      color: Colors.grey[500], height: 20, width: 2);

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoadedState) {
          //Constants.isInSystem = true;
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => MyHomePage(0),
            ),
            (route) => false,
          );
        }
        if (state is UserWrongAuthState) {
          SnackBar snackBar = SnackBar(
            content:
                Text(state.message, style: TextStyle(color: Colors.redAccent)),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                splashRadius: 12,
                color: Theme.of(context).iconTheme.color,
                onPressed: () => {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => WelcomeScreen(),
                    ),
                    (route) => false,
                  )
                },
              ),
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            backgroundColor: Colors.white,
            body: SizedBox.expand(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 35,
                        top: 90,
                      ),
                      child: Text(
                        "Авторизация",
                        style: TextStyle(
                          shadows: [
                            Shadow(color: Colors.black, offset: Offset(0, -5))
                          ],
                          color: Colors.transparent,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    widget.email,
                    widget.password,
                    Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 20, bottom: 10, top: 50),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 70),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () {
                          if (widget.email.isValid && widget.password.isValid) {
                            BlocProvider.of<UserBloc>(context).add(
                                new UserLoadEvent(widget.email.getText(),
                                    widget.password.getText()));
                            print(BlocProvider.of<UserBloc>(context)
                                .state
                                .toString());
                          }
                          //Constants.isInSystem = true;
                          /*Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => MyHomePage(0),
                            ),
                            (route) => false,
                          );*/
                        },
                        child: Text("Войти",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: FlatButton(
                          onPressed: () => IStudent.launchURL("https://i-student.herokuapp.com/auth"),
                          child: Text('Регистрация',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400)),
                          textColor: Colors.black,
                        ))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
