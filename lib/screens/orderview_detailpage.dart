import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rumailah/screens/checkout.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DetailPage extends StatefulWidget {
  final String storeName;
  final Map<String, dynamic> item;

  DetailPage({required this.item,required this.storeName});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Map<String, dynamic>> favoriteList= [];
  bool isFavorite = false;


  @override
  void initState() {
    super.initState();
    checkIfFavorite();
  }


  void checkIfFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedList = prefs.getString("keyList");

    if (storedList != null) {
      List<dynamic> decodedList = jsonDecode(storedList);
      List<Map<String, dynamic>> favoriteList =
      decodedList.map((item) => Map<String, dynamic>.from(item)).toList();


      bool alreadyFavorite =
      favoriteList.any((element) => element["name"] == widget.item["name"]);

      setState(() {
        isFavorite = alreadyFavorite;
      });
    }
  }


  void setFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedList = prefs.getString("keyList");
    List<Map<String, dynamic>> favoriteList = [];

    if (storedList != null) {
      List<dynamic> decodedList = jsonDecode(storedList);
      favoriteList =
          decodedList.map((item) => Map<String, dynamic>.from(item)).toList();
    }

    if (!isFavorite) {
      Map<String, dynamic> favorite = {
        "name": widget.item["name"],
        "details": widget.item["details"],
        "price": widget.item["price"],
        "image": widget.item["image"],
      };

      favoriteList.add(favorite);
      await prefs.setString("keyList", jsonEncode(favoriteList));

      setState(() {
        isFavorite = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: Duration(seconds: 2),content: Text("${widget.item["name"]} added to favorites!")),
      );
    } else {
      favoriteList.removeWhere((element) => element["name"] == widget.item["name"]);
      await prefs.setString("keyList", jsonEncode(favoriteList));

      setState(() {
        isFavorite = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: Duration(seconds: 2),content: Text("${widget.item["name"]} removed from favorites!")),
      );
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.item["name"], style: TextStyle(color: Colors.white),),
        leading: BackButton(color: Colors.white,),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(onPressed: (){
              setFavorite();
            }, icon: Icon( Icons.favorite,color:  isFavorite ? Colors.red : Colors.white, size: 40,)),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                image:DecorationImage(image: AssetImage(widget.item["image1"]),fit: BoxFit.cover,)
              ),
            ),
            Expanded(
                child: Container(
                  child:Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.item["name"],style: TextStyle(color: Color(0xFF4D5E47),
                          fontWeight: FontWeight.bold,fontSize: 30),),
                          Text(widget.item["price"],style: TextStyle(color: Color(0xFF263860),
                          fontSize: 25,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Container(
                            width: 300,
                            color: Color(0xFFF7F4F4),
                            child: Row(
                              children: [
                                Image.asset("assets/images/orderview/points.png"),
                                SizedBox(width: 5,),
                                Text("Earn 10 reward points with this purchase",style: TextStyle(color: Color(0xFF8B6D51)),),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                           child: Text("Details",style: TextStyle(color: Color(0xFF4D5E47),
                           fontWeight: FontWeight.bold,fontSize: 20),),
                          ),
                         Row(
                           children: [
                             Container(
                               width:70,
                               child: Divider(
                                 color: Color(0xFF4D5E47),
                                 thickness: 3,
                               )
                               ,
                             ),
                             Expanded(
                               child: Divider(
                                 color: Color(0xFFEDEDED),
                                 thickness: 2,
                               ),
                             )

                           ],
                         ),
                          SizedBox(height: 20,),
                          Container(
                            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an",style: TextStyle(color: Color(0xFF808581)),),
                          ),
                          SizedBox(height: 30,),
                          Container(
                            width: 330,
                            height: 55,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape:  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    backgroundColor:Color(0xFF4D5E47),
                                    foregroundColor: Colors.white),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen(storeName: widget.storeName,)));
                                }, child: Text("Add Cart",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),),
          ],
        ),


    );
  }
}