import 'package:cui_communication_system/student/s_profileDetails.dart';
import 'package:flutter/material.dart';
import 'package:cui_communication_system/profileDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class studentList extends StatefulWidget {
  @override
  _studentListState createState() => _studentListState();
}

class _studentListState extends State<studentList> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore _firebase = FirebaseFirestore.instance;
    return  MaterialApp(
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
          child: StreamBuilder<QuerySnapshot>(
            stream: _firebase.collection('users').doc('students').collection('user').snapshots(),
            builder: (context , snapshot){
              if(snapshot.hasData){
                final List<DocumentSnapshot> documents  = snapshot.data.docs;
                return ListView(
                    children: documents
                        .map((doc) =>
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => profileDetails(uid: doc['UserID'], name: doc['UserName'], image: doc['UserImage'],)));
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10 , right: 10 , bottom: 5, top: 10),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.black87.withAlpha(180),
                                    ),
                                    height: 70,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                child: ClipOval(
                                                  child: new SizedBox(
                                                    height: 100,
                                                    width: 100,
                                                    child: Image.network(
                                                      doc['UserImage'],
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 20,),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('UserID:  ' + doc['UserID'], style: TextStyle(color: Colors.white , fontSize: 8),),
                                                  SizedBox(height: 5,),
                                                  Text(doc['UserName'] , style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),

                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                ),
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
