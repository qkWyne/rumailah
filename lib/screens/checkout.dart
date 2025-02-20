import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                        backgroundColor: Color(0xFF4D5E4740),
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
                  child: Row(
                    children: [
                      // Image.asset(
                      //     "", width: 60, height: 60, fit: BoxFit.cover),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("name", style: TextStyle(
                                fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text("description", style: TextStyle(
                                color: Colors.grey, fontSize: 12)),
                            SizedBox(height: 5),
                            Text("price", style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.blue)),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                            Icons.remove_circle_outline, color: Colors.green),
                        onPressed: () {},
                      ),
                      Text("1", style: TextStyle(fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline, color: Colors.green),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              Container(
                color: Colors.white,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Voucher",style: TextStyle(color: Color(0xFF3A3A34),
                    fontWeight: FontWeight.bold,fontSize: 18),),
                    SizedBox(height: 20),
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
              SizedBox(height: 20),
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
                      _buildBillRow("MRP", "AED 50"),
                      _buildBillRow("Voucher", "-AED 1", isDiscount: true),
                      Divider(),
                      _buildBillRow("Bill Total", "AED 49", isTotal: true),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              Container(
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
  Widget _buildBillRow(String title, String value, {bool isDiscount = false, bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: TextStyle(
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                color: isDiscount ? Colors.red : Colors.black,
              )),
        ],
      ),
    );
  }

