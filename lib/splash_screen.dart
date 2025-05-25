import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart'; // Import your main screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainMenu()), // Replace MyHomePage with your main screen widget
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/360_F_818005943_gVOaWUstltqr34usDfefefk9ohbbgthYdJkon-Picsart-AiImageEnhancer.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Text(
              "Welcome to DigitZ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                shadows: <Shadow>[
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(4.0, 4.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
