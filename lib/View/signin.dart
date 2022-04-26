
import 'package:flutter/material.dart';
import '../helper/theme.dart';
import '../widget/widget.dart';

class SignIn extends StatefulWidget{
  final Function toggle;
  SignIn(this.toggle);
  @override
  _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: appMain(),
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height - 50,
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child :Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/logo.png" , height: 300, alignment: Alignment.center,),
              TextField(
                  style: TextStyle(
                      color: Colors.white
                  ),
                  decoration: textFieldInputDecoration("Email"),
              ),
              TextField(
                style: TextStyle(
                    color: Colors.white
                ),
                decoration: textFieldInputDecoration("Password")
              ),
              SizedBox(height: 8,),
              Container(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: Text("Forget Password ?" , style: simTextStyle(),) ,
                ),
              ),
              SizedBox(height: 16,),
            GestureDetector(
              onTap: () {
                //signIn();
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
                  "Sign In",
                  style: biggerTextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white),
              width: MediaQuery.of(context).size.width,
              child: Text(
                "Sign In with Google",
                style:
                TextStyle(fontSize: 17, color: CustomTheme.textColor),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have account? ",
                  style: simpleTextStyle(),
                ),
                GestureDetector(
                  onTap: () {
                    //widget.toggleView();
                  },
                  child: Text(
                      "Register now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
class appMain extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white54,);
  }
}