import 'package:flutter/material.dart';
class AllowLocation extends StatefulWidget {
  const AllowLocation({super.key});

  @override
  State<AllowLocation> createState() => _AllowLocationState();
}

class _AllowLocationState extends State<AllowLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 15,
            left: 210,
            child: Container(
              width: 250,
              height: 250,
              child: Image.asset("assets/images/allowlocation/gray.png"),
            ),
          ),
               Center(
                 child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SizedBox(height: 100,),
                         Container(
                           child: Image.asset("assets/images/createaccount/location.png"),
                         ),
                         SizedBox(height: 10,),
                         Container(
                           child: Text("Allow Location",style: TextStyle(
                               fontSize: 30,
                               fontWeight: FontWeight.bold,
                           color: Color(0xFF4D5E47)),),
                         ),
                         SizedBox(height: 10,),
                         Container(
                           child: Text("Allow Rumailah to send you location ",style: TextStyle(
                               fontSize: 16,
                           color: Color(0xFF7C7C83)),),
                         ),
                         SizedBox(height:70,),
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
                               }, child: Text("Allow",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                         ),
                         SizedBox(height: 10,),
                         TextButton(onPressed: (){
                           
                         }, child: Text("Skip",style: TextStyle(color: Color(0xFF7C7C83),fontSize: 16),))
                       ],
                     ),
               ),

          
                  ],
                ),
    );
  }
}
