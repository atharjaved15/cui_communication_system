import 'package:cui_communication_system/getstarted.dart';
import 'package:cui_communication_system/values.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset('images/logo.png', fit: BoxFit.cover, height: 200,),
        nextScreen: getStarted() ,
        splashTransition: SplashTransition.slideTransition,
      ),
    );
  }
}
