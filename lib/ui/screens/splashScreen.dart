// ignore_for_file: camel_case_types

import 'dart:async';
import 'package:flutter/material.dart';

import 'myHomePage.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<StatefulWidget> createState() => splashScreenState();
}

class splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height:100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset('assets/logo-removebg-preview.png'),
        ),

      ),
    );
  }
}
