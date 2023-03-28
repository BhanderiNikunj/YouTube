import 'dart:async';

import 'package:flutter/material.dart';

class FpleshScreen extends StatefulWidget {
  const FpleshScreen({Key? key}) : super(key: key);

  @override
  State<FpleshScreen> createState() => _FpleshScreenState();
}

class _FpleshScreenState extends State<FpleshScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'home');
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            "Assets/Images/UserLogo/Youtube.png",
            height: 125,
          ),
        ),
      ),
    );
  }
}
