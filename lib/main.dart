import 'package:flutter/material.dart';
import 'package:rumailah/screens/allow_location.dart';
import 'package:rumailah/screens/create_account.dart';
import 'package:rumailah/screens/edit_account.dart';
import 'package:rumailah/screens/home.dart';
import 'package:rumailah/screens/home_page.dart';
import 'package:rumailah/screens/login_otp.dart';
import 'package:rumailah/screens/order_placed%20_successfully.dart';
import 'package:rumailah/screens/payment_page.dart';
import 'package:rumailah/screens/select_language.dart';
import 'package:rumailah/screens/select_order_menu.dart';
import 'package:rumailah/screens/select_store_location.dart';
import 'package:rumailah/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:SelectOrderMenu(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
