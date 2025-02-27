import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rumailah/screens/about_us.dart';
import 'package:rumailah/screens/edit_account.dart';
import 'package:rumailah/screens/favorites_page.dart';
import 'package:rumailah/screens/home.dart';
import 'package:rumailah/screens/login_otp.dart';
import 'package:rumailah/screens/logout.dart';
import 'package:rumailah/screens/my_orders.dart';
import 'package:rumailah/screens/order_view.dart';
import 'package:rumailah/screens/privacy_policy.dart';
import 'package:rumailah/screens/reward_point.dart';
import 'package:rumailah/screens/scan_qr_code.dart';
import 'package:rumailah/screens/select_order_menu.dart';
import 'package:rumailah/screens/select_store_location.dart';
import 'package:rumailah/screens/term_conditions.dart';
import 'package:rumailah/screens/select_locator.dart';

class AccountPage extends StatefulWidget {
  final storeName ;
  const AccountPage({super.key,required this.storeName});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isDarkMode = false;

  _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginOtp()));
    } on FirebaseAuthException catch (e) {
      print("Error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Account", style: TextStyle(color: Color(0xFF6E7075))),
        elevation: 0,
        actions: [
          Row(
            children: [
              Text("Dark Mode",
                  style: TextStyle(color: Color(0xFF6E7075), fontSize: 14,
                      fontWeight: FontWeight.bold)),
              Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
                activeColor: Color(0xFF4D5E47),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                      "assets/images/accountmenu/person.jpg"),
                ),
                SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("User Name", style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text("+971 1234567890", style: TextStyle(
                          color: Color(0xFF9AA39C), fontSize: 16)),
                    ],
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => EditAccount()));
                    },
                    child: Image.asset(
                      "assets/images/accountmenu/edit.png", scale: 1.1,))
              ],
            ),
          ),
          SizedBox(height: 16),

          Container(
            padding: EdgeInsets.all(14),
            color: Colors.white,
            child: Row(
              children: [
                Image.asset(
                  "assets/images/accountmenu/raffle.png", scale: 1.2,),
                SizedBox(width: 10),
                Expanded(child: Text(
                    "Raffle Dashboard", style: TextStyle(fontSize: 16))),
                Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
              ],
            ),
          ),
          SizedBox(height: 16),

          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 60),
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) =>
                          Home(storeAddress: widget.storeName,)));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.asset("assets/images/accountmenu/home.png"),
                          SizedBox(width: 12),
                          Expanded(child: Text(
                              "Home", style: TextStyle(fontSize: 16))),
                          Icon(Icons.arrow_forward_ios, size: 18, color: Colors
                              .grey),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => RewardPointsScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.asset(
                              "assets/images/accountmenu/RewardPoints.png"),
                          SizedBox(width: 12),
                          Expanded(child: Text(
                              "Reward Points", style: TextStyle(fontSize: 16))),
                          Icon(Icons.arrow_forward_ios, size: 18, color: Colors
                              .grey),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ScanQrCode()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.asset("assets/images/accountmenu/Scan.png"),
                          SizedBox(width: 12),
                          Expanded(child: Text(
                              "Scan", style: TextStyle(fontSize: 16))),
                          Icon(Icons.arrow_forward_ios, size: 18, color: Colors
                              .grey),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyOrders()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.asset("assets/images/accountmenu/order.png"),
                          SizedBox(width: 12),
                          Expanded(child: Text(
                              "My Orders", style: TextStyle(fontSize: 16))),
                          Icon(Icons.arrow_forward_ios, size: 18, color: Colors
                              .grey),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SelectStoreLocation()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.asset("assets/images/accountmenu/Location.png"),
                          SizedBox(width: 12),
                          Expanded(child: Text(
                              "Location", style: TextStyle(fontSize: 16))),
                          Icon(Icons.arrow_forward_ios, size: 18, color: Colors
                              .grey),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => FavoritesPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.asset(
                              "assets/images/accountmenu/favorites.png"),
                          SizedBox(width: 12),
                          Expanded(child: Text(
                              "Favorites", style: TextStyle(fontSize: 16))),
                          Icon(Icons.arrow_forward_ios, size: 18, color: Colors
                              .grey),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AboutUs()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.asset("assets/images/accountmenu/about_us.png"),
                          SizedBox(width: 12),
                          Expanded(child: Text(
                              "About Us", style: TextStyle(fontSize: 16))),
                          Icon(Icons.arrow_forward_ios, size: 18, color: Colors
                              .grey),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PrivacyPolicy()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.asset(
                              "assets/images/accountmenu/Privacy_policy.png"),
                          SizedBox(width: 12),
                          Expanded(child: Text("Privacy and Policy",
                              style: TextStyle(fontSize: 16))),
                          Icon(Icons.arrow_forward_ios, size: 18, color: Colors
                              .grey),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => TermConditions()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.asset(
                              "assets/images/accountmenu/terms_conditions.png"),
                          SizedBox(width: 12),
                          Expanded(child: Text("Terms & Conditions",
                              style: TextStyle(fontSize: 16))),
                          Icon(Icons.arrow_forward_ios, size: 18, color: Colors
                              .grey),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Logout()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.asset("assets/images/accountmenu/logout.png"),
                          SizedBox(width: 12),
                          Expanded(child: Text(
                              "Logout", style: TextStyle(fontSize: 16))),
                          Icon(Icons.arrow_forward_ios, size: 18, color: Colors
                              .grey),
                        ],
                      ),
                    ),
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
