import 'package:flutter/material.dart';
import 'package:ANNDATA/screens/start_anndata.dart';
import 'package:ANNDATA/screens/welcome_screen.dart';
import 'package:ANNDATA/screens/login_screen.dart';
import 'package:ANNDATA/screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ANNDATA/screens/backend_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: StartAnndata.id,
      routes: {
        StartAnndata.id:(context) =>StartAnndata(),
        WelcomeScreen.id:(context) =>WelcomeScreen(),
        LoginScreen.id: (context) =>LoginScreen(),
        RegistrationScreen.id: (context) =>RegistrationScreen(),
        BackendScreen.id: (context) =>BackendScreen(),
      },
    );
  }
}
