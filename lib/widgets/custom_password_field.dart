import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomPasswordField extends StatefulWidget {
  String text;
  String RegExpStr;
  String prefixText;
  CustomPasswordField(this.text, this.RegExpStr, {this.prefixText = ''});
  bool isObscure = true;
  bool isValid = true;
  final myController = TextEditingController();
  String getText() {
    if (isValid)
      return myController.text;
    else
      return '';
  }

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
        ),
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
                    /*if (value == '') {
                      widget.isValid = true;
                      return null;
                    }

                    if (value!.length < 8) {
                      widget.isValid = false;
                      return 'Min 8 symbols!';
                    }

                    if (!RegExp(widget.RegExpStr).hasMatch(value)) {
                      //widget.myController.text = 'error';
                      widget.isValid = false;
                      return 'A-z 1-9';
                    } else {
                      widget.isValid = true;
                      return null;
                    }*/
                  },
                  controller: widget.myController,
                  obscureText: widget.isObscure,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    
                    suffixIconConstraints:
                        BoxConstraints(minHeight: 44, minWidth: 30),
                    hintText: widget.text,
                    suffixIcon: IconButton(
                      padding: EdgeInsets.only(left: 13, top: 10),
                      onPressed: () {
                        setState(() {
                          widget.isObscure = !widget.isObscure;

                          print(widget.isObscure);
                        });
                      },
                      icon: Constants.eyeIcon,
                    ),
                  ),
                ),
              ),
            ])));
  }
}
