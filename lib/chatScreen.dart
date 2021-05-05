
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models/message.dart';

class ChatScreen extends StatefulWidget {
  String senderId,receiverId;
  final FirebaseAuth auth;

  ChatScreen({
    @required this.senderId,
    @required this.receiverId,
    @required this.auth,
  });
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  String userName,email;
  @override
  void initState() {
    super.initState();
    setState(() {
      email = widget.auth.currentUser.email;
      final endIndex = email.indexOf("@");
      userName = email.substring(0, endIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat",
          style: TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Spartan',
              letterSpacing: 1.5),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
        ],
      ),
      backgroundColor: Colors.white70,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('messages').orderBy('timeStamp').snapshots(),
                builder: (context , snapshot){
                  if(!snapshot.hasData){
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blue,
                      ),
                    );
                  }
                  List<DocumentSnapshot> docs = snapshot.data.docs;
                  List<Widget> messages = docs.where((element) =>
                  (element['senderID'] == widget.senderId &&
                      element['receiverID'] == widget.receiverId) ||
                      (element['receiverID'] == widget.senderId &&
                          element['senderID'] == widget.receiverId),
                  )
                      .map((doc)=> Message(
                    user: doc['userName'],
                    text: doc['messageBody'],
                    timestamp: doc['timeStamp'],
                    mine: userName == doc['userName'],
                  ))
                      .toList();
                  return ListView(
                    controller: scrollController,
                    children: messages,
                  );

                }),
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                      ),
                      onSubmitted: (value) => sendChat(),
                      controller: messageController,
                      cursorColor: Colors.blueAccent,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        filled: true,
                        fillColor: Colors.white70,
                        hintText: 'send a message',
                        hintStyle:
                        TextStyle(fontFamily: 'Montserrat', fontSize: 12),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.paperPlane,
                    color: Colors.black,
                  ),
                  onPressed: sendChat,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Future<void> sendChat() async {
    if (messageController.text.length > 0) {
      await _firestore.collection("messages").add({
        'senderID': widget.senderId,
        'receiverID': widget.receiverId,
        'messageBody': messageController.text,
        'timeStamp': FieldValue.serverTimestamp(),
        'userName' : userName,
      });
      messageController.clear();
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }
}
