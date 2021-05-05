import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cui_communication_system/sendNoti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class f_profileDetails extends StatefulWidget {



  String uid,image,name;
  DocumentSnapshot documentSnapshot;

  f_profileDetails({
    @required this.image,
    @required this.uid,
    @required this.name,
  });

  @override
  _f_profileDetailsState createState() => _f_profileDetailsState();
}

class _f_profileDetailsState extends State<f_profileDetails> {


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
          title: Text('Registered Student Members'  , style: TextStyle(color: Colors.white),),
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
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width:  MediaQuery.of(context).size.width,
                      child: widget.image == null? Center(child: CircularProgressIndicator()) : Image.network(widget.image.toString() , fit: BoxFit.cover,),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                    Text('UserID: ' + widget.uid),
                    SizedBox(height: 10,),
                    Text(widget.name , style: TextStyle(fontSize: 25 , color: Colors.purple, fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 10,),
                    MaterialButton(
                      onPressed: ()async{
                        await FirebaseFirestore.instance.collection('users').doc('students').collection('user').doc(widget.uid).delete();
                        DocumentSnapshot firebaseuser = await FirebaseFirestore.instance.collection('users').doc('students').collection('user').doc(widget.uid).get();
                        if(firebaseuser.exists){
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
                        child: Text('Remove Account' , style: TextStyle(color:  Colors.white),),
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
