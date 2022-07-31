import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/login_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();

}

class InitState extends State<SplashScreen>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() async{
    var duration = Duration(seconds: 3);
    return new Timer(duration, loginRoute);
  }

  loginRoute(){
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => LoginScreen()
    ));
  }
  @override
  Widget build(BuildContext context) {
   return InitWidget();
  }
  Widget InitWidget(){
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: new Color(0xa851d4ff),
              gradient: LinearGradient(
                  colors: [(new Color(0xff1fcaf5)),(new Color(0xa851d4ff))],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
          ),
          
          Center(
            child: Container(
              child: Image.asset("images/image.png"),
            ),
          )
        ],
      ),
    );
  }

}