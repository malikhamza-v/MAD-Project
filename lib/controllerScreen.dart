import 'package:flutter/material.dart';

class ControllerScreen extends StatelessWidget {
  const ControllerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text('Controller'))),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                color: Colors.black,
                child: Icon(Icons.arrow_upward_outlined,
                    color: Colors.white, size: 50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 100,
                    child: Icon(
                      Icons.arrow_left_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                    color: Colors.black,
                  ),
                  Container(
                    width: 100,
                    child: Icon(
                      Icons.arrow_right_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                    color: Colors.black,
                  ),
                ],
              ),
              Container(
                width: 100,
                color: Colors.black,
                  child: Icon(
                Icons.arrow_downward_outlined,
                size: 50,
                color: Colors.white,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
