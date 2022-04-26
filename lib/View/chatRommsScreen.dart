import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger_doan/View/signin.dart';
import 'package:messenger_doan/services/auth.dart';

class Chatroom extends StatefulWidget {
  const Chatroom();

  @override
  State<Chatroom> createState() => _ChatroomState();
}

class _ChatroomState extends State<Chatroom> {
  AuthMethods authMethods = new AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png" , height: 40, 
          alignment: Alignment.topLeft ,),
        actions: [
          GestureDetector(
            onTap: (){
              authMethods.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
            },
            child: Container (
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.exit_to_app)
            ),
          ),
        ],
      ),
    );
  }
}
