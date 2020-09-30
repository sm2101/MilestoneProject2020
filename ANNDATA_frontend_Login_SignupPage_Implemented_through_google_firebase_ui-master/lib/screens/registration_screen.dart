import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'backend_screen.dart';
class RegistrationScreen extends StatefulWidget {
  static String id='registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String dropdownValue = 'CONSUMER';
  final _auth=FirebaseAuth.instance;
  String fullname;
  String dob;
  String gst;
  String email;
  String pass;
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
  }
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
                height: 30.0,
              ),
              Hero(
                tag: 'anndatalogo',
                child: Container(
                  height: 280.0,
                  child: Image.asset('images/anndatalogo1.png'),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  fullname=value;
                },
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  hintStyle: TextStyle(fontSize: 17.0, color: Colors.black87),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),

          GestureDetector(
           onTap: () => _presentDatePicker(),
             child: AbsorbPointer(
             child: TextFormField(
              keyboardType: TextInputType.datetime,
             decoration: InputDecoration(
             hintText: 'Date of Birth',
               hintStyle: TextStyle(fontSize: 17.0, color: Colors.black87),
             prefixIcon: Icon(
               Icons.dialpad,
        ),
        ),
       ),
        ),
          ),
              SizedBox(
                height: 8.0,
              ),


              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  gst=value;
                },
                decoration: InputDecoration(
                  hintText: 'GSTIN NUMBER',
                  hintStyle: TextStyle(fontSize: 17.0, color: Colors.black87),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: Center(child: Icon(Icons.arrow_downward)),
            iconSize: 30,
            elevation: 16,
            style: TextStyle(color: Colors.brown,fontSize: 20.0),
            underline: Container(
              height: 2,
              color: Colors.teal,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['CONSUMER', 'FARMER', 'COLD STORAGE', 'TRANSPORTER', 'PRODUCER']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
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
                    borderSide: BorderSide(color: Colors.teal, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2.0),
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
                    borderSide: BorderSide(color: Colors.teal, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),

              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async{
                      try{
                        final newUser = await _auth.createUserWithEmailAndPassword(
                            email: email, password: pass);
                        if(newUser!=null){
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
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
