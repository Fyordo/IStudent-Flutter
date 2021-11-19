import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTextFiled extends StatefulWidget {
  String text;
  Widget icon;
  String RegExpStr;
  String ErrorMessage;
  int minLength;
  String data;
  String prefixText;
  CustomTextFiled(this.text, this.icon, this.RegExpStr, this.ErrorMessage, this.minLength, this.data, {this.prefixText = ''});

  @override
  _CustomTextFiledState createState() => _CustomTextFiledState();

  final myController = TextEditingController();
  bool isValid = true;
  String getText() {
    if (isValid)
      return myController.text;
    else
      return 'not valid';
  }
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.myController.text = widget.data;
    return Container(
      height: 55,
      //width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20, ),
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Row(
          children: [
            Container(
              
              margin: EdgeInsets.only(top: 15, right: 10),
              child: Text(widget.prefixText, style: TextStyle(fontSize: 17, color: Colors.grey[800]),
              )
              ),
            Expanded(
              child: TextFormField(
                
                controller: widget.myController,
            
                validator: (value) {
                  if (value == '') {
                    widget.isValid = true;
                    return null;
                  }
            
                   if(value!.length < widget.minLength){
                    widget.isValid = false;
                    return 'Min ${widget.minLength} symbols!';
                  }
            
            
                  if (!RegExp(widget.RegExpStr).hasMatch(value)) {
                    //widget.myController.text = 'error';
                    widget.isValid = false;
                    return widget.ErrorMessage;
                  } else {
                    widget.isValid = true;
                    return null;
                  }
                },
                //keyboardType: TextInputType.emailAddress,
                
                decoration: InputDecoration(
            
                    //helperText: ' ',
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    hintText: widget.text,
                    suffixIconConstraints:
                        BoxConstraints(minHeight: 44, minWidth: 30),
                    
                    
                    
                    suffixIcon: widget.icon),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
