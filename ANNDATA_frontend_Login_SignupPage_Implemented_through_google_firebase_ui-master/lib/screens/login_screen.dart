import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'backend_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class LoginScreen extends StatefulWidget {
  static String id='login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth=FirebaseAuth.instance;
  bool showspin=false;
  String email;
  String pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 255, 217, 0.8),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Hero(
                tag: 'anndatalogo',
                child: Container(
                  height: 300.0,
                  child: Image.asset('images/anndatalogo1.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email=value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(fontSize: 17.0, color: Colors.black87),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.teal, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.teal, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  pass=value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(fontSize: 17.0, color: Colors.black87),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.teal, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.teal, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              Row(
                children :<Widget>[
               SizedBox(
                 width: 155.0,
               ) ,
              new FlatButton(
              onPressed: () {},
             child: Text(
              "Forgot Password ?",
              style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline,fontSize: 15.0)),
        ),

                ],
              ),
              
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      if(pass==null){
                        Alert(
                          context: context,
                          type: AlertType.info,
                          title: "E R R O R",
                          desc: "PLEASE ENTER PASSWOARD",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "RESTART",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed:() {
                                Navigator.pop(context);
                                setState(() {

                                });
                              },
                              width: 120,
                            )
                          ],
                        ).show();
                      }
                      else if(email==null){
                        Alert(
                          context: context,
                          type: AlertType.info,
                          title: "E R R O R",
                          desc: "PLEASE ENTER EMAIL",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "RESTART",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed:() {
                                Navigator.pop(context);
                                setState(() {

                                });
                              },
                              width: 120,
                            )
                          ],
                        ).show();
                      }
                      else if(pass==null && email==null){
                        Alert(
                          context: context,
                          type: AlertType.info,
                          title: "E R R O R",
                          desc: "PLEASE ENTER EMAIL AND PASSWOARD",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "RESTART",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed:() {
                                Navigator.pop(context);
                                setState(() {

                                });
                              },
                              width: 120,
                            )
                          ],
                        ).show();
                      }
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: pass);
                        if (user != null) {
                          Navigator.pushNamed(context, BackendScreen.id);
                        }
                      }
                      catch(e){
                        print(e);
                      }
                      },

                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Log In',
                    ),
                  ),
                ),
              ),
              new Container(
                margin: EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 10.0),

                child: new RaisedButton(
                    padding: EdgeInsets.only(top: 4.0,bottom: 4.0,left: 3.0),
                    color: const Color(0xFF4285F4),
                    onPressed: () {},
                    child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

                        new Image.asset(
                          'google/goo.png',
                          height: 48.0,
                        ),
                        new Container(
                            padding: EdgeInsets.only(left: 10.0,right: 10.0),
                            child: new Text("Sign in with Google",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
