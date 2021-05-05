import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cui_communication_system/sendNoti.dart';
import 'package:cui_communication_system/updateEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class s_eventDetails extends StatefulWidget {



  String docId,title,details,date;

  s_eventDetails({
    @required this.docId,
    @required this.details,
    @required this.date,
    @required this.title,
  });

  @override
  _s_eventDetailsState createState() => _s_eventDetailsState();
}

class _s_eventDetailsState extends State<s_eventDetails> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Image(image: AssetImage('images/logo.png') , color: Colors.white,),
          ),
          backgroundColor: Colors.purple[800],
          title: Text('Event Details'  , style: TextStyle(color: Colors.white),),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.date, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    SizedBox(height: 10,),
                    Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                    SizedBox(height: 10,),
                    Text(widget.details , style: TextStyle(fontSize: 18 , color: Colors.purple, fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 10,),
                  ],
                )
              ],
            ),
          ),
        ),
      ),



    );
  }
}
