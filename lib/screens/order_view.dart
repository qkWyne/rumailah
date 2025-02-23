import 'package:flutter/material.dart';

import 'orderview_detailpage.dart';
class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  final List<Map<String, dynamic>> orderMenu = [
    {
      "image": "assets/images/orderview/sandwich.png",
      "image1": "assets/images/orderview/sandwich1.png",
      "name": "Smoked Turkey",
      "details": "Smoked Tukey, and 3 cheese\nFilling Mix, in a soft Panini bread.",
      "price": "AED 25",
    },
    {
      "image": "assets/images/orderview/burger1.png",
      "image1": "assets/images/orderview/burger4.jpg",
      "name": "Four Cheese and Roas",
      "details": "Smoked Tukey, and 3 cheese\nFilling Mix, in a soft Panini bread.",
      "price": "AED 25",
    },
    {
      "image": "assets/images/orderview/sandwich.png",
      "image1": "assets/images/orderview/sandwich1.png",
      "name": "Spicy Chicken Srirac...",
      "details": "Smoked Tukey, and 3 cheese\nFilling Mix, in a soft Panini bread.",
      "price": "AED 25",
    },
    {
      "image": "assets/images/orderview/burger.png",
      "image1": "assets/images/orderview/burger4.jpg",
      "name": "Smoked Turkey",
      "details": "Smoked Tukey, and 3 cheese\nFilling Mix, in a soft Panini bread.",
      "price": "AED 25",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Sandwiches",
          style: TextStyle(color: Color(0xFF6E7075)),
        ),
      ),
      body: Center(
        child: Container(
          color: Color(0xFFF7F6F6),
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 350,
                        height: 60,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search Store",
                            hintStyle: TextStyle(color: Color(0xFF65656F)),
                            prefixIcon:
                            Icon(Icons.search, color: Color(0xFF65656F)),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFF4D5E47)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xFFD5D5D5)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: ListView.builder(
                    itemCount: orderMenu.length,
                    itemBuilder: (context, index) {
                      final store = orderMenu[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(item: store),
                            ),
                          );
                        },
                        child: Container(
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${orderMenu[index]["name"]}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(
                                              0xFF60605F), // Greenish color
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "${orderMenu[index]["details"]}",
                                        style: TextStyle(
                                            color: Color(0xFF60605F),
                                            fontSize: 10),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        orderMenu[index]["price"].toString(),
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
                               Container(
                                 width: 110,
                                   height:110,
                                   child: Image.asset(orderMenu[index]["image"]))
                              ],
                            ),
                          ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



