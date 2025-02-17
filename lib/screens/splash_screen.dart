import 'package:flutter/material.dart';
import 'package:rumailah/main.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Color(0xFF4D5E47),),
          Center(
            child: Image.asset("assets/images/splashscreen/bg.png",)
    ),
          Center(
            child: Image.asset("assets/images/splashscreen/logo.png")
    ),
        ],
      )
    );
  }
}
