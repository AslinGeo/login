import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login/login/loginpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
          ()=>Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          const Login()
                                                         )
                                       )
         );
  }
  Widget build(BuildContext context) {
    return Stack(
     children: [
        Container(
       alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/splashscreen/Flight.gif"),
          fit: BoxFit.cover),
          
        ),
        
      ),
      Container(
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.only(bottom: 30),
        child: const Text('Friends App',style: TextStyle(color: Colors.white,
        fontSize:20,fontWeight: FontWeight.bold,decoration: TextDecoration.none),),
      )
     ],
    );
  }
}