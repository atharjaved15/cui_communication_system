import 'package:cui_communication_system/admin/admin_login.dart';
import 'package:cui_communication_system/faculty/faculty_login.dart';
import 'package:cui_communication_system/student/student_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class home extends StatelessWidget {
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
        body: Center(
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
              child: Column(
                children: [
                 Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(top: 30.0),
                       child: Text('WELCOME' , style: TextStyle(color: Colors.blue[700],fontSize: 30 , fontWeight: FontWeight.bold),),
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
                  SizedBox(height: 50,),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => adminLogin()));
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
                                              child: Text('Log in as' , style: TextStyle(color: Colors.white , fontSize: 16  , fontWeight: FontWeight.bold),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 20.0),
                                              child: Text('Admin' , style: TextStyle(color: Colors.red , fontSize: 40  , fontWeight: FontWeight.bold),),
                                            ),

                                          ],
                                        ),
                                        SizedBox(width: 70),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset('images/admin.png', width: 100, height: 100,),
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
                                          child: Text('Be Careful while logging in as you will be directed to admin panel' , style: TextStyle(color: Colors.white , fontSize: 10  ,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0  ),
                          child: InkWell(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => facultyLogin()));},
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
                                          Image.asset('images/employee.png', height: 70, width: 70,),
                                          SizedBox(height: 10,),
                                          Text('Log in as' , style: TextStyle(color: Colors.white , fontSize: 12  , fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                      Text('Faculty' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 ,color: Colors.yellow),),
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
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => studentLogin()));},
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
                                      Text('Log in as' , style: TextStyle(color: Colors.white , fontSize: 12  , fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  Text('Student' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 ,color: Colors.greenAccent),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
