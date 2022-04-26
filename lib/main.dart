import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'View/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff145C9E),
        scaffoldBackgroundColor: Color(0xff6CA6CD),
        fontFamily: "OverpassRegular",
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: Color(0xff007EF4)),
      ),
      home: SignUp(),
    );
  }
}
