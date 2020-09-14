import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), (){
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(
            builder: (_) => HomeScreen()
          ),
              (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            child: Image.asset("assets/background.png",fit: BoxFit.cover,),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(width: 180,height: 180,child: Lottie.asset('assets/coffee_logo.json')),
                Container(
                  height: 4,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.black
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Coffee ",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                    Text("Cup",style: TextStyle(color: Colors.brown[800],fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
