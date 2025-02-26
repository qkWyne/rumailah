import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rumailah/screens/about_us.dart';
import 'package:rumailah/screens/account_menu.dart';
import 'package:rumailah/screens/allow_location.dart';
import 'package:rumailah/screens/checkout.dart';
import 'package:rumailah/screens/create_account.dart';
import 'package:rumailah/screens/edit_account.dart';
import 'package:rumailah/screens/favorites_page.dart';
import 'package:rumailah/screens/home.dart';
import 'package:rumailah/screens/home_page.dart';
import 'package:rumailah/screens/login_otp.dart';
import 'package:rumailah/screens/my_orders.dart';
import 'package:rumailah/screens/order_placed%20_successfully.dart';
import 'package:rumailah/screens/order_view.dart';
import 'package:rumailah/screens/otp_verify.dart';
import 'package:rumailah/screens/payment_page.dart';
import 'package:rumailah/screens/select_language.dart';
import 'package:rumailah/screens/select_locator.dart';
import 'package:rumailah/screens/select_order_menu.dart';
import 'package:rumailah/screens/select_store_location.dart';
import 'package:rumailah/screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user;
  @override
  void initState(){
    super.initState();
    user=FirebaseAuth.instance.currentUser;
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home:user != null ? SelectLocator() : SplashScreen(),
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
