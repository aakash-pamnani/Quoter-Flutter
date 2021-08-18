import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quoter_flutter/helper/values.dart';

import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/logo.png",
          height: Values.getHeight(context)*0.5,
          width: Values.getWidth(context)*0.5,
        ),
        Text(Values.appName,
        style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }
}
