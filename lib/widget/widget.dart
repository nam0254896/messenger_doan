import 'package:flutter/material.dart';

Widget appMain(BuildContext context){
  return AppBar(
     title: Image.asset(
       "assets/images/logo.png",
       height: 50,
     ),
  );
}
InputDecoration textFieldInputDecoration(String labelText){
  return InputDecoration(
    labelText: labelText,
    labelStyle: TextStyle(
        color: Colors.white70
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white)
    ),
  );
}
TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16);
}
TextStyle simTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16 , decoration: TextDecoration.underline);
}
TextStyle biggerTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 20);
}




