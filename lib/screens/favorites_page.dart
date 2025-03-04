import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Map<String, dynamic>> favoriteList = [];

  void getFavorate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? myList = prefs.getString("keyList");

    if (myList != null && myList.isNotEmpty) {
      List<dynamic> decodedList = jsonDecode(myList);
      setState(() {
        favoriteList = decodedList.map((item) => Map<String, dynamic>.from(item)).toList();
      });
    } else {
      setState(() {
        favoriteList = [];
      });
    }

    print("Fetched Favorites List: $favoriteList");
  }


  @override
  void initState() {
    super.initState();
    getFavorate();
  }


  // final List<Map<String, dynamic>> favorites = [
  //   {
  //     "image": "assets/images/orderview/sandwich.png",
  //     "name": "Smoked Turkey",
  //     "details": "Smoked Tukey, and 3 cheese\nFilling Mix, in a soft Panini bread.",
  //     "price": "AED 25",
  //   },
  //   {
  //     "image": "assets/images/orderview/burger1.png",
  //     "name": "Four Cheese and Roas",
  //     "details": "Smoked Tukey, and 3 cheese\nFilling Mix, in a soft Panini bread.",
  //     "price": "AED 25",
  //   },
  //   {
  //     "image": "assets/images/orderview/sandwich.png",
  //     "name": "Spicy Chicken Srirac...",
  //     "details": "Smoked Tukey, and 3 cheese\nFilling Mix, in a soft Panini bread.",
  //     "price": "AED 25",
  //   },
  //   {
  //     "image": "assets/images/orderview/burger.png",
  //     "name": "Smoked Turkey",
  //     "details": "Smoked Tukey, and 3 cheese\nFilling Mix, in a soft Panini bread.",
  //     "price": "AED 25",
  //   },
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Favorites",style: TextStyle(color: Color(0xFF6E7075)),),
      ),
      body:  Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: favoriteList.length,
          itemBuilder: (context, index) {
            return Container(
                width: 300,
                height: 150,
                margin: EdgeInsets.only(bottom: 12),
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2)),
                  ],
                ),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${favoriteList[index]["name"]}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(
                                0xFF60605F), // Greenish color
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "${favoriteList[index]["details"]}",
                          style: TextStyle(
                              color: Color(0xFF60605F),
                              fontSize: 10),
                        ),
                        SizedBox(height: 8),
                        Text(
                          favoriteList[index]["price"].toString(),
                          style: TextStyle(
                              color: Color(0xFF263860), fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8,),
                        Text("More Details",style: TextStyle(color: Color(0xFFEEA02C),
                            fontSize: 12)
                        ),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.favorite,color: Colors.black,size: 20,),
                        Expanded(
                          child: Container(
                              width: 110,
                              height:110,
                              child: Image.asset(favoriteList[index]["image"])),
                        ),
                      ],
                    ),
                  ],
                ),
              );

          },
        ),
      ),
    );
  }
}
