import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rumailah/screens/select_language.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SelectLanguage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Color(0xFF4D5E47),),
          Positioned.fill(
            child: Image.asset("assets/images/splashscreen/bg.png")
    ),
          Positioned.fill(
            child: Image.asset("assets/images/splashscreen/logo.png",)
    ),
        ],
      )
    );
  }
}
