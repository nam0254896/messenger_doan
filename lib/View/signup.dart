import 'package:flutter/material.dart';
import 'package:messenger_doan/View/chatRommsScreen.dart';
import '../helper/theme.dart';
import 'package:firebase_core/firebase_core.dart';

import '../services/auth.dart';
import '../widget/widget.dart';


class SignUp extends StatefulWidget {
  const SignUp();

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  AuthMethods authMethods = new AuthMethods();
  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameTextEdittingController = new TextEditingController();
  TextEditingController emailTextEdittingController = new TextEditingController();
  TextEditingController passWordTextEdittingController = new TextEditingController();

  signUp(){
    if(_formKey.currentState!.validate()){
      setState(() {
        isLoading = true;
      });
    authMethods.signUpWithEmailAndPassword
      (emailTextEdittingController.text, passWordTextEdittingController.text)!.then((val) {
      print("${val}");
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Chatroom()
      ));
    });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appMain(context),
      resizeToAvoidBottomInset: false,
      body: isLoading ?
      Container(
          child : Center(child: CircularProgressIndicator(),)) :
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 50,
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child :Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/logo.png" , height: 270, alignment: Alignment.center,),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val){
                            return val!.isEmpty || val.length < 8 ? "Please Provide UserName" : null;
                          },
                          controller: userNameTextEdittingController,
                          style: TextStyle(
                              color: Colors.white
                          ),
                          decoration: textFieldInputDecoration("UserName"),
                        ),
                        TextFormField(
                          validator: (val){
                            return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val!) ?
                            null : "Enter correct email";
                          },
                          controller: emailTextEdittingController,
                          style: TextStyle(
                              color: Colors.white
                          ),
                          decoration: textFieldInputDecoration("Email"),
                        ),
                        TextFormField(
                            validator:  (val){
                              return val!.length < 6 ? "Enter Password 6+ characters" : null;
                            },
                            controller: passWordTextEdittingController,
                            style: TextStyle(
                                color: Colors.white
                            ),
                            decoration: textFieldInputDecoration("Password")
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      child: Text("Forget Password ?" , style: simTextStyle(),) ,
                    ),
                  ),
                  SizedBox(height: 8,),
                  GestureDetector(
                    onTap: () {
                      signUp();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xff4D77FF),
                              const Color(0xff668AFF),
                              const Color(0xff809EFF),
                              const Color(0xff9AB1FF)
                            ],
                          )),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Sign Up",
                        style: biggerTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Sign Up with Google",
                      style:
                      TextStyle(fontSize: 17, color: CustomTheme.textColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have account? ",
                        style: simpleTextStyle(),
                      ),
                      GestureDetector(
                        onTap: () {
                          //widget.toggleView();
                        },
                        child: Text(
                          "SignIn now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
class appMain extends StatelessWidget implements PreferredSizeWidget {
  appMain(BuildContext context);
  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white54,);
  }
}