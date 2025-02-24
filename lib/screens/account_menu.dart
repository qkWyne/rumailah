import 'package:flutter/material.dart';
import 'package:rumailah/screens/about_us.dart';
import 'package:rumailah/screens/edit_account.dart';
import 'package:rumailah/screens/favorites_page.dart';
import 'package:rumailah/screens/home.dart';
import 'package:rumailah/screens/my_orders.dart';
import 'package:rumailah/screens/order_view.dart';
import 'package:rumailah/screens/privacy_policy.dart';
import 'package:rumailah/screens/scan_qr_code.dart';
import 'package:rumailah/screens/select_order_menu.dart';
import 'package:rumailah/screens/select_store_location.dart';
import 'package:rumailah/screens/term_conditions.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Account", style: TextStyle(color: Color(0xFF6E7075))),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF6E7075)),
          onPressed: () {},
        ),
        actions: [
          Row(
            children: [
              Text("Dark Mode", style: TextStyle(color: Color(0xFF6E7075), fontSize: 14,
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
      body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/images/accountmenu/person.jpg"),
                  ),
                  SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("User Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text("+971 1234567890", style: TextStyle(color: Color(0xFF9AA39C),fontSize: 16)),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditAccount()));
                    },
                      child: Image.asset("assets/images/accountmenu/edit.png",scale: 1.1,))
                ],
              ),
            ),
            SizedBox(height: 16),

            Container(
              padding: EdgeInsets.all(14),
              color: Colors.white,
              child: Row(
                children: [
                  Image.asset("assets/images/accountmenu/raffle.png",scale: 1.2,),
                  SizedBox(width: 10),
                  Expanded(child: Text("Raffle Dashboard", style: TextStyle(fontSize: 16))),
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
                    menuItem("Home","assets/images/accountmenu/home.png",Home()),
                    menuItem("Reward Points", "assets/images/accountmenu/RewardPoints.png",SelectOrderMenu()),
                    menuItem("Scan", "assets/images/accountmenu/Scan.png",ScanQrCode()),
                    menuItem("My Orders", "assets/images/accountmenu/order.png",MyOrders()),
                    menuItem("Location", "assets/images/accountmenu/Location.png",SelectStoreLocation()),
                    menuItem("Favorites", "assets/images/accountmenu/favorites.png",FavoritesPage()),
                    menuItem("About Us", "assets/images/accountmenu/about_us.png",AboutUs()),
                    menuItem("Privacy and Policy", "assets/images/accountmenu/Privacy_policy.png",PrivacyPolicy()),
                    menuItem("Terms & Conditions", "assets/images/accountmenu/terms_conditions.png",TermConditions()),
                    menuItem("Logout", "assets/images/accountmenu/logout.png", Home(),isLast: true),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }


  Widget menuItem(String title, String image , Widget navigate, {bool isLast = false}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => navigate));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Row(
          children: [
            Image.asset(image),
            SizedBox(width: 12),
            Expanded(child: Text(title, style: TextStyle(fontSize: 16))),
            Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
