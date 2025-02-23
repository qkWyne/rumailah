import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:rumailah/screens/myorder_detail.dart';
class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final List<Map<String, String>> ongoingOrders = [
    {
      "storeName": "Rumailah Café - Corniche",
      "orderNo": "#321DERS",
      "totalItems": "2",
      "orderStatus": "Ongoing",
      "date": "11/02/2025",
      "price": "AED 25",
    },
  ]; final List<Map<String, String>> completedOrders = [
    {
      "storeName": "Rumailah Café - Corniche",
      "orderNo": "#32001",
      "totalItems": "2",
      "orderStatus": "Completed",
      "date": "11/02/2025",
      "price": "AED 25",
    },   {
      "storeName": "Rumailah Café - Corniche",
      "orderNo": "#32002",
      "totalItems": "2",
      "orderStatus": "Completed",
      "date": "11/02/2025",
      "price": "AED 25",
    },   {
      "storeName": "Rumailah Café - Corniche",
      "orderNo": "#32003",
      "totalItems": "2",
      "orderStatus": "Completed",
      "date": "11/02/2025",
      "price": "AED 25",
    },
  ]; final List<Map<String, String>> canceledOrders = [
    {
      "storeName": "Rumailah Café - Corniche",
      "orderNo": "#321DERS",
      "totalItems": "2",
      "orderStatus": "Canceled",
      "date": "11/02/2025",
      "price": "AED 25",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xFFF7F6F6),
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("My Orders"),
            toolbarHeight: 70,
            bottom: TabBar(indicatorWeight: 8,indicatorColor: Color(0xFF4D5E47),
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Ongoing",style: TextStyle(color: Color(0xFF4D5E47),fontSize: 16,fontWeight: FontWeight.bold),)),),
              Tab(
                child: Align(
                    alignment: Alignment.center,
                child: Text("Completed",style: TextStyle(color: Color(0xFF4D5E47),fontWeight: FontWeight.bold,fontSize: 16),)),),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                child: Text("Canceled",style: TextStyle(color: Color(0xFF4D5E47),fontWeight: FontWeight.bold,fontSize: 16),)),),
            ]),

          ),
          body:
          TabBarView(children:[
            Center(child:ListView.builder(itemCount: ongoingOrders.length,itemBuilder: (context,index){
              return SizedBox(
                child: Padding(padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child:Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ongoingOrders[index]["storeName"].toString(),
                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Color(0xFF4D5E47)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10,bottom: 10),
                              width: 350,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(ongoingOrders[index]["orderNo"].toString(), style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black)),
                                Text(ongoingOrders[index]["date"].toString(), style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                            "Total ${ongoingOrders[index]["totalItems"]} Items",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Color(0xFF4D5E47)),
                                ),
                                Text(
                                  ongoingOrders[index]["price"].toString(),
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Color(0xFF4D5E47)),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Order Status : ${ongoingOrders[index]["orderStatus"]}",
                              style: TextStyle(color: Color(0xFFCA951B), fontWeight: FontWeight.w600,fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),),
              );
            }), ),
            Center(child:ListView.builder(itemCount: completedOrders.length, itemBuilder: (context,index){
              final orders = completedOrders[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyorderDetail(orders: orders),
                    ),
                  );
                },
                child: SizedBox(
                  child: Padding(padding: EdgeInsets.all(8.0),
                    child:Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child:Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                completedOrders[index]["storeName"].toString(),
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Color(0xFF4D5E47)),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10,bottom: 10),
                                width: 350,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(completedOrders[index]["orderNo"].toString(), style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black)),
                                  Text(completedOrders[index]["date"].toString(), style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black)),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total ${completedOrders[index]["totalItems"]} Items",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Color(0xFF4D5E47)),
                                  ),
                                  Text(
                                    completedOrders[index]["price"].toString(),
                                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Color(0xFF4D5E47)),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Order Status : ${completedOrders[index]["orderStatus"]}",
                                style: TextStyle(color: Color(0xFFCA951B), fontWeight: FontWeight.w600,fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),),
            Center(child:ListView.builder(itemCount: canceledOrders.length,itemBuilder: (context,index){
              return SizedBox(
                child: Padding(padding: EdgeInsets.all(8.0),
                  child:Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child:Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              canceledOrders[index]["storeName"].toString(),
                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Color(0xFF4D5E47)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10,bottom: 10),
                              width: 350,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(canceledOrders[index]["orderNo"].toString(), style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black)),
                                Text(canceledOrders[index]["date"].toString(), style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total ${canceledOrders[index]["totalItems"]} Items",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Color(0xFF4D5E47)),
                                ),
                                Text(
                                  canceledOrders[index]["price"].toString(),
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Color(0xFF4D5E47)),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Order Status : ${canceledOrders[index]["orderStatus"]}",
                              style: TextStyle(color: Color(0xFFCA951B), fontWeight: FontWeight.w600,fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),),
          ])

      ),
    );
  }
}