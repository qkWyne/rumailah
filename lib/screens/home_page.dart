import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> bannerImages = [
    "assets/images/homepage/banner.png",
    "assets/images/homepage/banner.png",
    "assets/images/homepage/banner.png",
    "assets/images/homepage/banner.png",
  ];

  final List<Map<String, String>> products = [
    {
      "image": "assets/images/homepage/burger.jpg",
      "name": "Halloumi Ciabatta",
      "price": "AED 25",
    },
    {
      "image": "assets/images/homepage/shawarma.jpg",
      "name": "Chicken Tikka Wrap",
      "price": "AED 25",
    },
    {
      "image": "assets/images/homepage/pizza.jpg",
      "name": "pizza",
      "price": "AED 25",
    },
  ];

  final List<Map<String, String>> stores = [
    {
      "image": "assets/images/homepage/1.jpg",
      "name": "Rumailah Café - Jumeirah",
      "icon": "assets/images/homepage/location.png",
      "location": "Jumeirah, Dubai - United Arab Emirates",
    },
    {
      "image": "assets/images/homepage/2.jpg",
      "name": "Rumailah Café - Jumeirah",
      "icon": "assets/images/homepage/location.png",
      "location": "Jumeirah, Dubai - United Arab Emirates",
    },
    {
      "image": "assets/images/homepage/3.jpg",
      "name": "Rumailah Café - Jumeirah",
      "icon": "assets/images/homepage/location.png",
      "location": "Jumeirah, Dubai - United Arab Emirates",
    },

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFF7F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              child: Image.asset("assets/images/homepage/profile.png")
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi User Welcome to",
                  style: TextStyle(color: Color(0xFF6F726C), fontSize: 12),
                ),
                Row(
                  children: [
                    Text(
                      "Rumailah Café - Corniche",
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
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage("assets/images/homepage/banner1.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/homepage/point.png"),
                    SizedBox(width: 8),
                    Text("1500 Points", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  ],),
                SizedBox(height: 10),
                Text("Redeem your points now!", style: TextStyle(color: Colors.white, fontSize: 14)),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(top: 10,bottom: 10),
                  width: 247,
                  child: DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 2.0,
                    dashLength: 8.0,
                    dashColor: Color(0xFFADABB0),
                    dashGapLength: 8.0,
                  ),
                ),

                Row(
                  children: [
                    Column(
                      children: [
                        Text("Collect 1 point for every AED 10 spent",style: TextStyle(color: Color(0xFF6B93BB),
                        fontSize: 10),),
                        Text("unlock rewards on reaching 75 points",style: TextStyle(color: Color(0xFF6B93BB),
                        fontSize: 10),),
                      ],
                    ),
                    TextButton(onPressed: (){
                    }, child: Row(
                      children: [
                        Text("View Rewards",style: TextStyle(fontSize: 13,color: Colors.white),),
                        Icon(Icons.arrow_forward_ios,color: Colors.white,)
                      ],
                    ))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),

          CarouselSlider(
            options: CarouselOptions(height: 100, autoPlay: true, enlargeCenterPage: true),
            items: bannerImages.map((image) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                ),
              );
            }).toList(),
          ),

          SizedBox(height: 16),

          SectionHeader(title: "Popular Products"),
          SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: products.map((product) {
                return ProductCard(
                  image: product["image"]!,
                  name: product["name"]!,
                  price: product["price"]!,
                );
              }).toList(),
            ),
          ),

          SizedBox(height: 16),

          SectionHeader(title: "Popular Stores"),
          SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: stores.map((stores) {
                return StoreCard(
                  image: stores["image"]!,
                  name: stores["name"]!,
                  icon: stores["icon"]!,
                  location: stores["location"]!,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}


class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color(0xFF505155))),
        Row(
          children: [
            Text("View All", style: TextStyle(color: Color(0xFF263860), fontSize: 14,fontWeight: FontWeight.bold)),
            Icon(Icons.keyboard_arrow_right,color:Color(0xFF263860) ,),
          ],
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image, name, price;

  ProductCard({required this.image, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:Image.asset(image, height: 100, width: 160, fit: BoxFit.cover),
          ),
          SizedBox(height: 6),
          Text(name, style: TextStyle(color: Color(0xFF263860),fontSize: 14, fontWeight: FontWeight.bold)),
          SizedBox(height: 2),
          Text(price, style: TextStyle(color: Color(0xFF263860), fontSize: 14)),
        ],
      ),
    );
  }
}

class StoreCard extends StatelessWidget {
  final String image, name, icon,location;

  StoreCard({required this.image, required this.name, required this.icon, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(right: 10,bottom: 130),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image,height: 120,width: 250,fit: BoxFit.cover),
          ),
          SizedBox(height: 6),
          Text(name, style: TextStyle(color: Color(0xFF26375F),fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 2),
          Row(
            children: [
              Image.asset(icon,fit: BoxFit.cover),
              SizedBox(width: 3,),
              Text(location, style: TextStyle(color: Color(0xFF53565A), fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}