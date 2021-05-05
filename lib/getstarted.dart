import 'package:cui_communication_system/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class getStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.7, 1.4],
                  colors: [
                    Colors.white,
                    Colors.purple[800],
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Column(
                   children: [
                     Center(
                       child:  Image.asset('images/logo.png', fit: BoxFit.cover, height: 100,),
                     ),
                     Center(
                       child:Text('COMSATS UNIVERSITY ISLAMABAD' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold , color: Colors.purple[800]), ),
                     ),
                     Center(
                       child:Text('Communication System' , style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic , color: Colors.black), ),
                     ),
                   ],
                 ),
                  //SizedBox(height: 348,),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100.0),
                    child: MaterialButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
                    },
                      child: Container(
                        height: 30,
                        width: 300,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.2, 1.4],
                          colors: [
                            Colors.purple[800],
                            Colors.blueAccent,
                          ],
                        ),
                          color: Colors.blue[400],
                        ),
                        child: Center(child: Text('Get Started' , style: TextStyle(color: Colors.white),)),
                      ),
                    ),
                  )

                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
