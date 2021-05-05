import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cui_communication_system/sendNoti.dart';
import 'package:cui_communication_system/updateEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class eventDetails extends StatefulWidget {



  String docId,title,details,date;

  eventDetails({
    @required this.docId,
    @required this.details,
    @required this.date,
    @required this.title,
  });

  @override
  _eventDetailsState createState() => _eventDetailsState();
}

class _eventDetailsState extends State<eventDetails> {

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
                    MaterialButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => updateEvent(docId: widget.docId,)));
                      },
                      minWidth: MediaQuery.of(context).size.width * 0.9,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text('Update' , style: TextStyle(color:  Colors.white),),
                      ),

                    ),
                    SizedBox(height: 10,),
                    MaterialButton(
                      onPressed: ()async{
                        await FirebaseFirestore.instance.collection('users').doc('students').collection('user').doc(widget.docId).delete();
                        DocumentSnapshot document = await FirebaseFirestore.instance.collection('Events').doc('Uploaded').collection('Events').doc(widget.docId).get();
                        if(document.exists){
                          Fluttertoast.showToast(msg: 'User is not Deleted Successfully');

                        }
                        else{
                          Fluttertoast.showToast(msg: 'User is Deleted Successfully');
                          Navigator.pop(context);
                        }

                      },
                      minWidth: MediaQuery.of(context).size.width * 0.9,
                      color: Colors.red,
                      child: Center(
                        child: Text('Remove Event' , style: TextStyle(color:  Colors.white),),
                      ),

                    ),
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
