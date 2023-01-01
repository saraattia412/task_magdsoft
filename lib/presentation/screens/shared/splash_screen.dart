// ignore_for_file: annotate_overrides

import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3) ,() => Navigator.pushNamed(context, '/login'));
  }
  Widget build(BuildContext context) {

    //Make the Design Responsive
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    return   Scaffold(

      body: Stack(
        children: [
          Image(
            image: const AssetImage('assets/images/splash.png'),
            height: height,
            width: width,
            fit: BoxFit.fitWidth,
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: CircularProgressIndicator()),
          ),
        ],),

    );
}
}
