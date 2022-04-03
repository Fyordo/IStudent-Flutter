import 'package:flutter/material.dart';

import '../../constants.dart';
import 'custom_password_field.dart';

class CustomPassWithConfim extends StatefulWidget {
  late CustomPasswordField password;
  String prefixText;

  CustomPassWithConfim(@required String text, @required String RegExpStr,
      {this.prefixText = ''}) {
    password = CustomPasswordField(text, RegExpStr);
  }

  bool isObscure = true;
  bool isValid = true;
  final myController = TextEditingController();

  String getText() {
    if (isValid)
      return myController.text;
    else
      return 'not valid';
  }

  @override
  _CustomPassWithConfimState createState() => _CustomPassWithConfimState();
}

class _CustomPassWithConfimState extends State<CustomPassWithConfim> {
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      widget.password,
      Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Row(children: [
            Container(
                margin: EdgeInsets.only(top: 15, right: 10),
                child: Text(
                  widget.prefixText,
                  style: TextStyle(fontSize: 17, color: Colors.grey[800]),
                )),
            Expanded(
              child: TextFormField(
                validator: (value) {
                  if (value == '') {
                    widget.isValid = true;
                    return null;
                  }

                  if (widget.password.getText() == '') {
                    widget.isValid = false;
                    return 'Enter correct original password';
                  }
                  if (value != widget.password.getText()) {
                    //widget.myController.text = 'error';
                    widget.isValid = false;
                    return 'Password mismatch';
                  } else {
                    widget.isValid = true;
                    return null;
                  }
                },
                controller: widget.myController,
                obscureText: widget.isObscure,
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    suffixIconConstraints:
                        BoxConstraints(minHeight: 44, minWidth: 30),
                    hintText: 'Confirm Password*',
                    suffixIcon: IconButton(
                        padding: EdgeInsets.only(left: 13),
                        onPressed: () {
                          setState(() {
                            widget.isObscure = !widget.isObscure;
                            print(widget.isObscure);
                          });
                        },
                        icon: Constants.eyeIcon)),
              ),
            ),
          ]),
        ),
      )
    ]);
  }
}
