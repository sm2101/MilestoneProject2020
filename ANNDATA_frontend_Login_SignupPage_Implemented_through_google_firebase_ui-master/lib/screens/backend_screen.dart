import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ANNDATA/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BackendScreen extends StatefulWidget {
  static String id='backend_screen';
  @override
  _BackendScreenState createState() => _BackendScreenState();
}

class _BackendScreenState extends State<BackendScreen> {
  final _auth=FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    }
    catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
    ),
    body: SafeArea(
        child:Column(
          children: [
            SizedBox(
              height: 250.0
            ),
            Center(
              child: Container(

                child: Text(
                'NOW WORK ON BACKEND'
    ),
              ),
            ),
            Container(
              height: 50.0,
              width: 300.0,
              child: FlatButton(
                child: Text(
                  'PRESS'
                ),
                color: Colors.yellow,
                 onPressed: (){
                   Alert(
                     context: context,
                     type: AlertType.info,
                     title: "F I N I S H E D",
                     desc: "Now WORK ON BACKEND",
                     buttons: [
                       DialogButton(
                         child: Text(
                           "END",
                           style: TextStyle(color: Colors.white, fontSize: 20),
                         ),
                         onPressed:() {
                           Navigator.pop(context);
                           setState(() {});
                         },
                         width: 120,
                       )
                     ],
                   ).show();
                 },
              ),
            ),
          ],
        ),
    ),
    );
  }
}
