import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'welcome_screen.dart';
void main() {
  runApp(StartAnndata());
}
class StartAnndata extends StatefulWidget {
  static String id='start_anndata';
  @override
  _StartAnndataState createState() => _StartAnndataState();
}

class _StartAnndataState extends State<StartAnndata> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller=AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
   controller.forward();
   controller.addListener(() {
     setState(() {});

   });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Color.fromRGBO(217, 255, 217, 0.8).withOpacity(controller.value),
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 119.0,
                  ),
                  Container(
                    child: CircleAvatar(
                      radius: 150.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('image/anndatalogo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),

                  Container(
                    width: 200.0,
                    child: FlatButton(
                      child: Text(
                          'PRESS IT AND GO!!!'
                      ),
                      color: Colors.lightGreenAccent,
                      onPressed: (){
                        Navigator.pushNamed(context, WelcomeScreen.id);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

