import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Map<int, int> itemCounts = {};

  void _incrementCounter(int index) {
    setState(() {
      itemCounts[index] = (itemCounts[index] ?? 1) + 1;
    });
  }

  void _decrementCounter(int index) {
    setState(() {
      if ((itemCounts[index] ?? 1) > 1) {
        itemCounts[index] = (itemCounts[index] ?? 1) - 1;
      }if((itemCounts[index] ?? 1) > 1){
        itemCounts.remove(index);
      }
    });
  }
  double calculateTotal() {
    double total = 0;
    itemCounts.forEach((index, quantity) {
      double price = double.parse(orderMenu[index]["price"].split(" ")[1]);
      total += price * quantity;
    });
    return total;
  }

  final List<Map<String, dynamic>> orderMenu = [
    {
      "image": "assets/images/orderview/sandwich.png",
      "name": "Smoked Turkey",
      "details": "Smoked Tukey, and 3 cheese\nFilling Mix, in a soft Panini bread.",
      "price": "AED 25",
    },
    {
      "image": "assets/images/orderview/burger.png",
      "name": "Four Cheese and Roas",
      "details": "Smoked Tukey, and 3 cheese\nFilling Mix, in a soft Panini bread.",
      "price": "AED 25",
    },
  ];

  @override
  Widget build(BuildContext context) {

    double total = calculateTotal();
    double discount = 0;
    double finalTotal = total - discount;

    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xFFF7F6F6),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {},
          ),
          title: Text("Checkout", style: TextStyle(color: Color(0xFF6E7075))),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                        backgroundColor: Colors.grey.shade300,
                        child: Icon(Icons.store_mall_directory, size: 40, color: Color(0xFF4D5E47))),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rumailah Café - Corniche",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold,
                            color: Color(0xFF4D5E47))),
                        Text("Al Corniche St - Al Fuaiah - Fujairah",
                            style: TextStyle(color: Colors.black, fontSize: 12)),
                        Text("United Arab Emirates",
                            style: TextStyle(color: Colors.black, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/orderview/points.png",scale: 1.1,),
                  SizedBox(width: 5),
                  Text("Earn 30 reward points with this order.",
                      style: TextStyle(color: Color(0xFF8B6D51))),
                ],
              ),

              SizedBox(height: 10),

              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child:ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: orderMenu.length,itemBuilder: (context,index){
                        final order = orderMenu[index];
                       return Column(
                         children: [
                           Row(
                              children: [
                                Image.asset(order["image"],scale: 1.5,fit: BoxFit.cover),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(order["name"], style: TextStyle(
                                          fontWeight: FontWeight.bold,fontSize: 16,color: Color(0xFF60605F))),
                                      SizedBox(height: 5),
                                      Text(order["details"], style: TextStyle(
                                          color: Colors.grey, fontSize: 12)),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [Text(order["price"], style: TextStyle(
                                            fontWeight: FontWeight.bold, color: Color(0xFF263860),fontSize: 18)),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                    Icons.remove_circle_outline, color: Color(0xFF4D5E47)),
                                                onPressed: () {
                                                  _decrementCounter(index);
                                                  print(itemCounts);
                                                },
                                              ),
                                              Text("${itemCounts[index] ?? 1}", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                                              IconButton(
                                                icon: Icon(Icons.add_circle, color: Color(0xFF4D5E47)),
                                                onPressed: () {
                                                  _incrementCounter(index);
                                                  print(itemCounts);
                                                },
                                              ),],),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                           if (index != orderMenu.length - 1)
                           Container(
                             margin: EdgeInsets.only(top: 20,bottom: 20),
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
                         ],
                       );
                      }),

                ),
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Voucher",style: TextStyle(color: Color(0xFF3A3A34),
                    fontWeight: FontWeight.bold,fontSize: 18),),
                    SizedBox(height: 5),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Apply Voucher Code",
                        hintStyle: TextStyle(color: Color(0xFF707070)),
                        prefixIcon: Icon(Icons.discount,color: Color(0xFF4D5E47),),
                        suffixIcon: Icon(Icons.keyboard_arrow_right,),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF4D5E47)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE1E1E1)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      ),

                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bill Details",style: TextStyle(color: Color(0xFF3A3A34),
                          fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("MRP", style: TextStyle(fontSize: 16)),
                          Text("AED ${total.toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Voucher", style: TextStyle(fontSize: 16)),
                          Text("-AED ${discount.toStringAsFixed(2)}", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 16
                              )),
                        ],
                      ),
                    ),
                      Divider(
                        thickness:2 ,
                        color: Color(0xFFEEEEEE),
                      ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Bill Total", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                      Text("AED ${finalTotal.toStringAsFixed(2)}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:Color(0xFF4D5E47),
                            fontSize: 18,
                          )),
                    ],
                  ),
                ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                width: 310,
                height: 55,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor:Color(0xFF4D5E47),
                        foregroundColor: Colors.white),
                    onPressed: (){
                    }, child: Text("Order",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
