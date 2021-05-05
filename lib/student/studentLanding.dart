import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cui_communication_system/eventList.dart';
import 'package:cui_communication_system/notiViewer.dart';
import 'package:cui_communication_system/student/s_eventList.dart';
import 'package:cui_communication_system/student/s_profileDetails.dart';
import 'package:cui_communication_system/student/s_studentList.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../memeberList.dart';

class studentLanding extends StatefulWidget {
  String u_id = FirebaseAuth.instance.currentUser.uid.toString();
  String uid;
  studentLanding({
    @required this.uid,
});
  @override
  _studentLandingState createState() => _studentLandingState();
}

class _studentLandingState extends State<studentLanding> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image(
                image: AssetImage('images/logo.png'), color: Colors.white,),
            ),
            backgroundColor: Colors.purple[800],
            title: Text('CUI Communication System',
              style: TextStyle(color: Colors.white),),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text('Student Home Page' , style: TextStyle(color: Colors.blue[700],fontSize: 30 , fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text('COMSATS University Islamabad' , style: TextStyle(color: Colors.purple[700],fontSize: 20, fontWeight: FontWeight.bold , ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text('Communication System' , style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold , fontStyle: FontStyle.italic),),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0  ),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => notiViewer(uid: widget.uid,)));
                            },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.41,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(200),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Icon(Icons.notification_important , color: Colors.yellow , size: 70,),
                                        SizedBox(height: 10,),
                                        Text('See My' , style: TextStyle(color: Colors.white , fontSize: 12  , fontWeight: FontWeight.bold),),
                                        Text('Notifications' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 ,color: Colors.yellow),),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20),
                        child: InkWell(
                          onTap: () async {
                            DocumentSnapshot doc =  await FirebaseFirestore.instance.collection('users').doc('students').collection('user').doc(widget.u_id).get();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => s_profileDetails(image: doc['UserImage'] , uid: doc['UserID'], name: doc['UserName'] )));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.41,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(200),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Image.asset('images/graduated.png', height: 70, width: 70,),
                                    SizedBox(height: 10,),
                                    Text('Open My' , style: TextStyle(color: Colors.white , fontSize: 12  , fontWeight: FontWeight.bold),),
                                    Text('Profile' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 ,color: Colors.greenAccent),),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                  Center(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => s_eventList()));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.90,
                                height: MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(200),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,

                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left:20.0, top: 20, bottom: 5),
                                              child: Text('See' , style: TextStyle(color: Colors.white , fontSize: 16  , fontWeight: FontWeight.bold),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 20.0),
                                              child: Text('Events' , style: TextStyle(color: Colors.red , fontSize: 40  , fontWeight: FontWeight.bold),),
                                            ),

                                          ],
                                        ),
                                        SizedBox(width: 50),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(Icons.calendar_today , color: Colors.yellow, size: 100,),
                                            ),
                                          ],
                                        ),
                                      ],

                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('You can see the ongoing and upcoming events by clicking it' , style: TextStyle(color: Colors.white , fontSize: 10  ,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                  Center(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => membersList(senderId: widget.uid,)));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.90,
                                height: MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(200),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,

                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left:20.0, top: 20, bottom: 5),
                                              child: Text('Welcome to Chat ' , style: TextStyle(color: Colors.white , fontSize: 16  , fontWeight: FontWeight.bold),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 20.0),
                                              child: Text('Chats' , style: TextStyle(color: Colors.red , fontSize: 40  , fontWeight: FontWeight.bold),),
                                            ),

                                          ],
                                        ),
                                        SizedBox(width: 50),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Icon(Icons.message , color: Colors.blue, size: 100,),
                                            ),
                                          ],
                                        ),
                                      ],

                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('You can send and receive Messages ' , style: TextStyle(color: Colors.white , fontSize: 10  ,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));;
  }
}
