import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:rumailah/screens/order_placed%20_successfully.dart';
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Payment",style: TextStyle(color: Color(0xFF6E7075)),),
      ),
      body: Container(
        color: Color(0xFFF7F6F6),
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Text("Bill Total",style: TextStyle(color: Color(0xFF4D5E47),
                          fontSize: 25),),
                        ),
                        Container(
                          child: Text("ADE 49",style: TextStyle(color: Color(0xFF4D5E47),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFF7F6F6),
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  child: Image.asset("assets/images/paymentpage/money.png"),
                                ),
                              ),
                            ),
                            title: Text("Cash",style: TextStyle(color: Color(0xFF565C54),
                            fontSize: 18,fontWeight: FontWeight.bold),),
                            trailing: IconButton(onPressed: (){

                            }, icon: Icon(Icons.arrow_forward_ios)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10,bottom: 10),
                          width: 320,
                          child: DottedLine(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            lineLength: double.infinity,
                            lineThickness: 2.0,
                            dashLength: 10.0,
                            dashColor: Color(0xFFADABB0),
                            dashGapLength: 10.0,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFF7F6F6),
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Image.asset("assets/images/paymentpage/credit-card.png"),
                                ),
                              ),
                            ),
                            title: Text("Credit/Debit Cards",style: TextStyle(color: Color(0xFF565C54),
                            fontSize: 18,fontWeight: FontWeight.bold),),
                            trailing: IconButton(onPressed: (){

                            }, icon: Icon(Icons.arrow_forward_ios)),
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                width: 320,
                height: 55,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor:Color(0xFF4D5E47),
                        foregroundColor: Colors.white),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPlacedSuccessfully()));
                    }, child: Text("Order Now",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
