import 'dart:io';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class addStudent extends StatefulWidget {
  @override
  _addStudentState createState() => _addStudentState();
}

class _addStudentState extends State<addStudent> {

  String DPpath;
  final picker = ImagePicker();
  File image ;

  Future  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedFile!=null)
      {
        image = File(pickedFile.path);
      }
    });
  }

  String uImage,uid,uEmail;
  DatabaseReference _reference = FirebaseDatabase.instance.reference();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  String email,pass,name;
  FirebaseAuth _auth = FirebaseAuth.instance;

  var storage = FirebaseStorage.instance.ref('Students').child(faker.person.name().toString());

  uploadImages() async {
    UploadTask uploadTask = storage.putFile(image);
    await uploadTask.whenComplete(() => null).then((value) async{
      await value.ref.getDownloadURL().then((value) => {
        DPpath=value.toString(),
      });
    });
  }

  getValues(){
    email = emailController.text;
    pass = passController.text;
  }
  setValues(){
    User user = _auth.currentUser;
    uEmail = user.email;
    uid = user.uid;
    name = nameController.text;
  }
  saveData(){
    _firebaseFirestore.collection('users').doc('students').collection('user').doc('$uid').set(
      {
        'UserID' : uid,
        'UserEmail ' : uEmail,
        'UserImage' : DPpath,
        'UserName' : name,
      }
    );
  }

  Future registerUser() async {
    Firebase.initializeApp();
    UserCredential user = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
    return user;
  }

  toast(UserCredential user){

    if(user!=null){
      Fluttertoast.showToast(msg: 'User Registered Successfully');

    }
    else
      Fluttertoast.showToast(msg: 'User is not Registered Successfully');
  }
  int check =0;
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
          title: Text('CUI Communication System'  , style: TextStyle(color: Colors.white),),
        ),
        body: SingleChildScrollView(
          child: Container(
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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                        Text('Add A Student' , style: TextStyle(color: Colors.purple, fontSize: 25, fontWeight: FontWeight.bold),),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                        InkWell(
                          onTap: chooseImage,
                          child: Stack(
                            children: [

                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              Positioned(
                                top: 0,bottom: 0,left: 0,right: 0,
                                child:
                                image == null
                                    ?
                                Icon(Icons.add_a_photo , size: 50,)
                                    :
                                CircleAvatar(
                                  radius: 100,
                                  child: ClipOval(
                                      child: new SizedBox(
                                        width: 150.0,
                                        height: 150.0,
                                        child: Image.file(
                                          image,
                                          fit: BoxFit.cover,
                                        ),
                              )

                              ))
                              )],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            hintText: 'Name',
                            hoverColor: Colors.purple[800],
                            prefixIcon: Icon(Icons.admin_panel_settings_outlined),

                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            hintText: 'Email',
                            hoverColor: Colors.purple[800],
                            prefixIcon: Icon(Icons.alternate_email),

                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                        TextField(
                          controller: passController,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[100],
                            hintText: 'Password',
                            hoverColor: Colors.purple[800],
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: InkWell(child: Icon(Icons.remove_red_eye),
                              onTap: (){
                                setState(() {
                                  if(check==0){check=1;}
                                  else
                                    check=0;
                                });
                              },
                            ),
                          ),
                          obscureText: check==0?true:false,
                        ),

                      ],
                    ),
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () async{
                            getValues();
                            UserCredential user = await registerUser();
                            setValues();
                            await uploadImages();
                            saveData();
                            toast(user);
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => adminLanding()));
                          },
                          height: MediaQuery.of(context).size.height * 0.06,
                          minWidth: MediaQuery.of(context).size.width *0.9,
                          color: Colors.redAccent,
                          child: Center(
                            child: Text('Add New Student', style: TextStyle(color: Colors.white),),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
