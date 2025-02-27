import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RewardPointsScreen(),
  ));
}

class RewardPointsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> rewardHistory = [
    {"type": "earn", "message": "You earned 30 reward points for this online order.", "date": "09 Oct, 2024, 02:40 PM"},
    {"type": "spend", "message": "Buy Coffee 50 Points", "date": "09 Oct, 2024, 02:40 PM"},
    {"type": "earn", "message": "You earned 30 reward points for this online order.", "date": "09 Oct, 2024, 02:40 PM"},
    {"type": "spend", "message": "Buy Coffee 50 Points", "date": "09 Oct, 2024, 02:40 PM"},
    {"type": "earn", "message": "You earned 30 reward points for this online order.", "date": "09 Oct, 2024, 02:40 PM"},
    {"type": "spend", "message": "Buy Coffee 50 Points", "date": "09 Oct, 2024, 02:40 PM"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reward Points"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 320,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFF0F2F5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(5, 5), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: Color(0xFF707070))),
                      ),
                      child:Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Image.asset("assets/images/scanQR/points.png"),
                      ),

                    ),
                    SizedBox(width: 10,),
                    Container(
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text("Available Points",style: TextStyle(color: Color(0xFF70737B),fontSize: 16),),
                          ),
                          Container(
                            child: Text("100",style: TextStyle(color: Color(0xFF4D5E47),fontSize: 25,fontWeight: FontWeight.bold),),
                          ),

                        ],
                      ),

                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text("Reward History", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),

            Expanded(
              child: ListView.builder(
                itemCount: rewardHistory.length,
                itemBuilder: (context, index) {
                  var item = rewardHistory[index];
                  bool isEarned = item["type"] == "earn";

                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isEarned ? Colors.green : Colors.red,
                        child: Icon(
                          isEarned ? Icons.add : Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(item["message"], style: TextStyle(fontSize: 14)),
                      subtitle: Text(item["date"], style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
