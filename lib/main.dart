import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Social Ui',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primaryColor: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

