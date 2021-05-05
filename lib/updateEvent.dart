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

class updateEvent extends StatefulWidget {
  String docId;

  updateEvent({
    @required this.docId,
});


  @override
  _updateEventState createState() => _updateEventState();
}

class _updateEventState extends State<updateEvent> {

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  TextEditingController titleController = new TextEditingController();
  TextEditingController detailsController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();

  String title,details,date;

  getValues(){

    title = titleController.text;
    details = detailsController.text.toString();
    date = dateController.text;
  }
  saveData(){
    _firebaseFirestore.collection('Events').doc('Uploaded').collection('Events').doc(widget.docId).update(
      {
        'title' : title,
        'details ' : details,
        'date' : date,
      }
    ).whenComplete(() => ({
      Fluttertoast.showToast(msg: 'Event Updated Successfully!'),
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
          title: Text('Upload Event or News'  , style: TextStyle(color: Colors.white),),
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
                    Icon(Icons.calendar_today , size: 200, color:  Colors.purple,),
                    Text('Update Event' , style:  TextStyle(fontSize: 25, color: Colors.red, fontWeight: FontWeight.bold ),),
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
                    DateTimePicker(
                      controller: dateController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.calendar_today),
                          labelText: 'Select Date'
                      ),
                      firstDate: DateTime.utc(2020, 1),
                      lastDate: DateTime.utc(2022,1),
                    ),
                  ],
                ),
                Column(
                  children: [
                    MaterialButton(onPressed: (){
                      getValues();
                      saveData();
                    },
                      color: Colors.purple,
                      minWidth: MediaQuery.of(context).size.width,
                      child: Center(child: Text('Update Event' , style: TextStyle(color: Colors.white),),),
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
