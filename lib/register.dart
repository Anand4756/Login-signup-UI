import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'dashboard.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  final _auth = FirebaseAuth.instance;
  String email='';
  String password='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        fit: StackFit.expand,
        children: [

          Image.asset('images/design.png',fit: BoxFit.cover,),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 48.0),
                          child: Text('Create',style: TextStyle(color: Colors.white, fontSize: 50,)),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 48.0),
                          child: Text('Account',style: TextStyle(color: Colors.white, fontSize: 40),),
                        ),
                      ]
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,10,20,10),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,


                      decoration: InputDecoration(

                        labelText: 'Email',
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.email, color: Colors.white,),

                      ),
                      onChanged: (value) {
                        email = value;
                        print(email);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,10,20,10),
                    child: TextField(

                      obscureText: true,

                      decoration: InputDecoration(

                        labelText: 'Password',
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.security, color: Colors.white,),

                      ),
                      onChanged: (value) {
                        password = value;
                        print(password);
                      },
                    ),
                  ),
                  SizedBox(height: 40,),
                  Row(

                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 48.0),
                        child: Text('Sign Up',textDirection: TextDirection.ltr,style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.bold),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 48.0),
                        child: FloatingActionButton(
                          onPressed: () async {
                            try {
                              final newUser = await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                              if (newUser != null) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return dashboard();
                                    },
                                    ));
                              }

                            } catch (e) {
                              print(e);
                            }
                          },



                          child: const Icon(Icons.navigate_next,color: Colors.white,),
                          backgroundColor: Color(0xff4b4747),
                        ),
                      ),

                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:48.0),
                    child: TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return login();
                      },
                      ));
                      print('login clicked');
                    }, child:  Text('Sign In',
                      textDirection: TextDirection.ltr,style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                    ),),

                  ),
                ],
              ),
            ),
          ),



        ],
      ),
    );
  }
}



