import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:messenger_doan/View/signin.dart';
import 'package:messenger_doan/View/signup.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);
  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn();
    }else{
      return SignUp();
    }
  }
}
