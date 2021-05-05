import 'package:cui_communication_system/faculty/facultyLanding.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:faker/faker.dart';

class sendNoti extends StatefulWidget {

  String uid;

  sendNoti({
    @required this.uid,
});

  @override
  _sendNotiState createState() => _sendNotiState();
}

class _sendNotiState extends State<sendNoti> {

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  TextEditingController titleController = new TextEditingController();
  TextEditingController detailsController = new TextEditingController();

  String title,details,date;

  getValues(){

    title = titleController.text;
    details = detailsController.text.toString();
  }
  saveData(){
    _firebaseFirestore.collection('Noti').doc('ByAdmin').collection(widget.uid).doc().set(
        {
          'title' : title,
          'details ' : details,
          'date' : DateTime.now().toString(),
        }
    ).whenComplete(() => ({
      Fluttertoast.showToast(msg: 'Notification Sent Successfully!'),
      Navigator.pop(context),
    }));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Image(image: AssetImage('images/logo.png') , color: Colors.white,),
          ),
          backgroundColor: Colors.purple[800],
          title: Text('Send Notifications'  , style: TextStyle(color: Colors.white),),
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(Icons.notification_important , size: 200, color:  Colors.purple,),
                    Text('Send Specific Notifications' , style:  TextStyle(fontSize: 25, color: Colors.red, fontWeight: FontWeight.bold ),),
                  ],
                ),
                Column(
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                        prefixIcon: Icon(Icons.title),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                    TextField(
                      controller: detailsController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Details',
                        prefixIcon: Icon(Icons.details),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                  ],
                ),
                Column(
                  children: [
                    MaterialButton(onPressed: (){
                      getValues();
                      saveData();
                    },
                      color: Colors.yellow,
                      minWidth: MediaQuery.of(context).size.width,
                      child: Center(child: Text('Send Notifications' , style: TextStyle(color: Colors.black),),),
                    ),
                  ],
                ),
              ],
            ),
          ),


        ),
      ),
    );
  }
}
