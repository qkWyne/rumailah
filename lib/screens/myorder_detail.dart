import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
class MyorderDetail extends StatefulWidget {
  const MyorderDetail({Key? key, required this.orders, required this.orderNo,required this.orderstatus}) : super(key: key);
  final List<Map<String, dynamic>> orders;
  final String orderNo;
  final String orderstatus;

  @override
  State<MyorderDetail> createState() => _MyorderDetailState();
}

class _MyorderDetailState extends State<MyorderDetail> {
  final List<Map<String, String>> orderStatus = [
    {
      "status": "Order placed",
      "date": "12.11.2021",
      "time": "01:00 PM",
      "icon": "✅",
      "color": "0xFF4CAF50", // Green
    },
    {
      "status": "Accepted",
      "date": "12.11.2021",
      "time": "04:00 PM",
      "icon": "📦",
      "color": "0xFFFFC107", // Yellow
    },
    {
      "status": "Completed",
      "date": "12.11.2021",
      "time": "05:00 PM",
      "icon": "🤝",
      "color": "0xFF1E88E5", // Blue
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.orderNo),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: widget.orderstatus == "Ongoing" ? ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),onPressed: (){
              Navigator.pop(context);
            }, child: Text("Cancel",style: TextStyle(color: Colors.white),)) : null,
          )
        ],
      ),
    body:SingleChildScrollView(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child:ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: widget.orders.length,itemBuilder: (context,index){

                      return Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(widget.orders[index]["image"],scale: 1.5,fit: BoxFit.cover),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.orders[index]["name"], style: TextStyle(
                                        fontWeight: FontWeight.bold,fontSize: 16,color: Color(0xFF60605F))),
                                    SizedBox(height: 5),
                                    Text(widget.orders[index]["details"], style: TextStyle(
                                        color: Colors.grey, fontSize: 12)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [Text(widget.orders[index]["price"], style: TextStyle(
                                          fontWeight: FontWeight.bold, color: Color(0xFF263860),fontSize: 18)),
                                        Container(
                                          child: Text("${widget.orders[index]["totalItems"]}x",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (index != widget.orders.length - 1)
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
              SizedBox(height: 20,),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order Status", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: orderStatus.length,
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color(int.parse(orderStatus[index]["color"]!)),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(child: Text(orderStatus[index]["icon"]!, style: TextStyle(fontSize: 20))),
                                    ),
                                    if (index != orderStatus.length - 1)
                                      Container(
                                        width: 3,
                                        height: 50,
                                        color: Colors.grey,
                                      ),
                                  ],
                                ),
                                SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(orderStatus[index]["status"]!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                    Text(orderStatus[index]["date"]!, style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                                Spacer(),
                                Text(orderStatus[index]["time"]!, style: TextStyle(color: Colors.black)),
                              ],
                            );
                          },
                        ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                color: Color(0xFF4D5E47),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Bill Total",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,)),
                          Text("25 AED",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Paid From",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,)),
                          Text("Online",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white,)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
    ),

      );
  }
}