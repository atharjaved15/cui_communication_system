import 'package:cui_communication_system/values.dart';
import 'package:flutter/material.dart';

void main(){
       runApp(splash());
}

class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('images/logo.png', fit: BoxFit.cover, height: 200,),
            )

          ],
        ),
      ),
    );
  }
}
