import 'package:flutter/material.dart';
import 'package:cui_communication_system/profileDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class notiViewer extends StatefulWidget {

  String uid;

  notiViewer({
    @required this.uid,
});
  @override
  _notiViewerState createState() => _notiViewerState();
}

class _notiViewerState extends State<notiViewer> {
  FirebaseFirestore _firebase = FirebaseFirestore.instance;
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
          title: Text('Notifications'  , style: TextStyle(color: Colors.white),),
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
          child: StreamBuilder<QuerySnapshot>(
            stream: _firebase.collection('Noti').doc('ByAdmin').collection(widget.uid).snapshots(),
            builder: (context , snapshot){
              if(snapshot.hasData){
                final List<DocumentSnapshot> documents  = snapshot.data.docs;
                return ListView(
                    children: documents
                        .map((doc) =>
                        InkWell(
                          onTap: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => profileDetails(email: doc['UserEmail'], image: doc['UserImage'], name: doc['UserName'],)));
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 10 , right: 10 , bottom: 5, top: 10),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.2,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: Colors.purple,
                                          width: 2,
                                          style: BorderStyle.solid,
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(doc['title'], style: TextStyle(color: Colors.purple , fontSize: 25, fontWeight: FontWeight.bold),),
                                          Text(doc['date'], style: TextStyle(color: Colors.green , fontSize: 14 , fontWeight: FontWeight.bold),),
                                          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                                          Text(doc['details '],  overflow:  TextOverflow.fade ,style: TextStyle(color: Colors.black , fontSize: 14 ),),
                                        ],
                                      ),
                                    ),
                                  )
                              )
                          ),
                        )).toList()
                );
              }
              else
                return Center(child: CircularProgressIndicator());
            },
          ),

        ),
      ),
    );
  }
}


