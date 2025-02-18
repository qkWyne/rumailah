import 'package:flutter/material.dart';
class OrderPlacedSuccessfully extends StatefulWidget {
  const OrderPlacedSuccessfully({super.key});

  @override
  State<OrderPlacedSuccessfully> createState() => _OrderPlacedSuccessfullyState();
}

class _OrderPlacedSuccessfullyState extends State<OrderPlacedSuccessfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                width: 300,
                height: 300,
                child: Image.asset("assets/images/orderplacedsuccessfuly/order.png"),
              ),
              SizedBox(height: 10,),
              Container(
                child: Text("Order Placed Successfully",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              ),
              SizedBox(height: 10,),
              Container(
                child: Text("Thanks for your order. Your order has placed",style: TextStyle(
                    fontSize: 16,color: Color(0xFF707070)),),
              ),
              Container(
                child: Text("successfully. Please continue your order.",style: TextStyle(
                    fontSize: 16,color: Color(0xFF707070)),),
              ),
              SizedBox(height: 20,),
              Container(
                child: Text("Order ID #987643",style: TextStyle(
                    fontSize: 30,color: Color(0xFF4D5E47)),),
              ),
              Container(
                margin: EdgeInsets.only(top: 100, ),
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
                    }, child: Text("Continue",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
              ),
              TextButton(onPressed: (){

              }, child: Text("Go to My Order",style: TextStyle(color: Color(0xFF858886),fontSize: 16),))
            ],
          ),
        ),
      ),

    );
  }
}
