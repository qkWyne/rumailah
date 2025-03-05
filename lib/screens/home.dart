import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rumailah/screens/account_menu.dart';
import 'package:rumailah/screens/home_page.dart';
import 'package:rumailah/screens/scan_qr_code.dart';
import 'package:rumailah/screens/select_locator.dart';
import 'package:rumailah/screens/select_order_menu.dart';
import 'package:rumailah/screens/select_store_location.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatefulWidget {
   final String storeAddress ;
  const Home({super.key,required this.storeAddress});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  String firstName = "" ;
  File? _image;


  Future<void> loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? base64Image = prefs.getString('saved_image');

    if (base64Image != null) {
      List<int> imageBytes = base64Decode(base64Image);
      File imageFile = File('${Directory.systemTemp.path}/temp_image.png');
      await imageFile.writeAsBytes(imageBytes);

      setState(() {
        _image = imageFile;
      });
      print("Image Loaded from SharedPreferences");
    } else {
      print("No Image Found!");
    }
  }



  _loadUserData() async {
    try {
      DocumentSnapshot userDoc =
      await FirebaseFirestore.instance.collection("users").doc(uid).get();

      if (userDoc.exists) {
        Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;

        setState(() {
          firstName = data["firstName"] ?? "";
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }


  @override
  void initState() {
    super.initState();
    _loadUserData();
    loadImage();
  }


  int _selectedIndex = 0;

  // Screens List
  List<Widget> get _screens => [
    HomePage(storeName: widget.storeAddress,),
    ScanQrCode(),
    SelectStoreLocation(),
    AccountPage(storeName: widget.storeAddress),
  ];

  // Handle Bottom Nav Bar item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0 ?AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectLocator()));
          },
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: _image == null
                    ? Center(child: Icon(Icons.person,size: 40,))
                    : ClipOval(
                  child: Image.file(
                    File(_image!.path),
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi $firstName Welcome to",
                    style: TextStyle(color: Color(0xFF6F726C), fontSize: 12),
                  ),
                 Row(
                      children: [
                        Text(
                          widget.storeAddress,
                          style: TextStyle(
                            color: Color(0xFF6F726C),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: Colors.black),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ): null,
      extendBody: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: ClipPath(
        clipper: WavyNavBarClipper(), 
        child: BottomAppBar(
          color: Colors.white,
          child: Container(
            color: Colors.transparent,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.home_outlined, size: 30),
                  color: _selectedIndex == 0 ? Color(0xFF26375F) : Color(0xFFC7C5C9),
                  onPressed: () => _onItemTapped(0),
                ),
                IconButton(
                  icon: Icon(Icons.qr_code_scanner_outlined, size: 30),
                  color: _selectedIndex == 1 ? Color(0xFF26375F) : Color(0xFFC7C5C9),
                  onPressed: () => _onItemTapped(1),
                ),
                SizedBox(width: 120), // Space for the floating button
                IconButton(
                  icon: Icon(Icons.location_on_outlined, size: 30),
                  color: _selectedIndex == 2 ? Color(0xFF26375F) : Color(0xFFC7C5C9),
                  onPressed: () => _onItemTapped(2),
                ),

                IconButton(
                  icon: Icon(Icons.person_outline, size: 30),
                  color: _selectedIndex == 3 ? Color(0xFF26375F) : Color(0xFFC7C5C9),
                  onPressed: () => _onItemTapped(3),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0xFF26375F85),
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: Color(0xFF4D5E47),
          shape: CircleBorder(),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectOrderMenu(storeName: widget.storeAddress)));
          },
          child: Image.asset("assets/images/homepage/cup.png"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// Custom clipper for wave effect in the Bottom Navigation Bar
class WavyNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double notchRadius = 40;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(width * 0.3, 0)
      ..quadraticBezierTo(width * 0.38, notchRadius - 10, width * 0.42, notchRadius)
      ..quadraticBezierTo(width * 0.50, notchRadius + 20, width * 0.58, notchRadius)
      ..quadraticBezierTo(width * 0.62, notchRadius - 10, width * 0.7, 0)
      ..lineTo(width, 0)
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}