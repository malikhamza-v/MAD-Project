import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/home_screen.dart';

import 'signup_screen.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()  =>InitState();
}

class InitState extends State<LoginScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }
  Widget initWidget(){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: Color(0xa851d4ff),
                gradient: LinearGradient(
                  colors: [(new Color(0xff1fcaf5)),(new Color(0xa851d4ff))],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child:Image.asset("images/image.png"),
                      height: 150,
                      width:150,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20,top: 05),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white

                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20,left: 20,top: 70),
              padding: EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: [BoxShadow(
                  offset: Offset(0,10),
                  blurRadius: 50,
                  color: Color(0xffEEEEEE)
                )]
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: emailController,
                cursorColor: Color(0xff1289a5),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color(0xff1289a5),
                  ),
                  hintText: "Enter Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20,left: 20,top: 20),
              padding: EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [BoxShadow(
                      offset: Offset(0,10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)
                  )],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                cursorColor: Color(0xff1289a5),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color(0xff1289a5),
                  ),
                  hintText: "Enter Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20,right: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: Text("Forget password"),
                onTap: () => {

                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 50),
              padding: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.center ,
              height :54,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [(new Color(0xff1fcaf5)), (new Color(0xa851d4ff))],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight
                ),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [BoxShadow(
                  offset: Offset(0,10),
                blurRadius: 50,
                color: Color(0xffEEEEEE)
            )]
              ),
              child: InkWell(
                onTap: () {
                  signIn();
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:20
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("DON'T HAVE ACCOUNT?"),
                  GestureDetector(
                    onTap: () =>{
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SignUpScreen()
                      ))
                    },
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                        fontSize: 19,
                        color: Color(0xa8248bad)
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void signIn() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }).onError((error, stackTrace) {
      print(error.toString());
      print("no");
    });
  }
}