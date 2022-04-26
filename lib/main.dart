

import 'package:flutter/material.dart';
import 'package:login/splashscreen/splashScreen.dart';

void main(){
  runApp(const LoginApp());
}

class LoginApp extends StatefulWidget {
  const LoginApp({ Key? key }) : super(key: key);

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      title:"Splash Screen",
      home:SplashScreen(),
      debugShowCheckedModeBanner: false
      
    );
  }
}