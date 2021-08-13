import 'package:flutter/material.dart';
import 'register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
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

          SingleChildScrollView(
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
                        child: Text('Welcome',style: TextStyle(color: Colors.white, fontSize: 50,)),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Back',style: TextStyle(color: Colors.white, fontSize: 40),),
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
                    },
                  ),
                ),
                SizedBox(height: 40,),
                Row(

                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 48.0),
                      child: Text('Sign In',textDirection: TextDirection.ltr,style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 48.0),
                      child: FloatingActionButton(
                        onPressed: () async {
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            if (user != null) {
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
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:48.0),
                  child: TextButton(onPressed: () {
                    Navigator.pop(context);
                    print('signup clicked');
                  }, child:  Text('Sign Up',
                    textDirection: TextDirection.ltr,style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                  ),),

                ),
              ],
            ),
          ),



        ],
      ),
    );
  }
}

