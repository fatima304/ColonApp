import 'dart:async';
import 'package:doctor_appointment_app/screens/Introduction.dart';
import 'package:doctor_appointment_app/screens/auth_page.dart';
import 'package:doctor_appointment_app/screens/slider.dart';
import 'package:flutter/material.dart';

class LogoPage extends StatefulWidget {
  @override
  _LogoPageState createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 6),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Landing())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 122,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 120,
              backgroundImage: AssetImage('assets/Colon.jpeg'),
              backgroundColor: Colors.white,
            ),
          ),
          Text(
            'Early Detection of',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27.5,
              fontFamily: 'Quicksand',
            ),
          ),
          Text(
            'colorectal cancer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27.5,
              fontFamily: 'Quicksand',
            ),
          ),
          Container(
            child: Row(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
