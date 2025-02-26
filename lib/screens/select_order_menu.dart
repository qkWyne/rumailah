import 'package:flutter/material.dart';
import 'package:rumailah/screens/order_view.dart';
class SelectOrderMenu extends StatefulWidget {
  final String storeName;
  const SelectOrderMenu({super.key,required this.storeName});

  @override
  State<SelectOrderMenu> createState() => _SelectOrderMenuState();
}

class _SelectOrderMenuState extends State<SelectOrderMenu> {
  final List<Map<String, String>> ItemsMenu = [
    {
      "name": "Sandwiches",
      "image": "assets/images/selectordermanu/sandwiches.png",
    },
    {
      "name": "Croissant",
      "image": "assets/images/selectordermanu/croissant.png",
    },
    {
      "name": "Salads",
      "image": "assets/images/selectordermanu/salads.png",
    },
    {
      "name": "Ice Cremes",
      "image": "assets/images/selectordermanu/icecremes.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F6F6),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order",
              style: TextStyle(color: Color(0xFF6F726C), fontSize: 25),
            ),
            Row(
              children: [
                Text(
                  widget.storeName,
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
      ),
       body: Center(
         child: Container(
           color: Color(0xFFF7F6F6),
           child: Column(
             children: [
               Container(
                 height: 150,
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.only(
                         bottomLeft: Radius.circular(15.0),
                         bottomRight: Radius.circular(15.0))
                 ),
                 child: Column(
                   children: [
                     SizedBox(height: 20,),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 16),
                       child: Container(
                         width: 350,
                         height: 60,
                         child: TextField(
                           decoration: InputDecoration(
                             hintText: "Search Store",
                             hintStyle: TextStyle(color: Color(0xFF65656F)),
                             prefixIcon: Icon(Icons.search, color: Color(
                                 0xFF65656F)),
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
                             enabledBorder:
                             OutlineInputBorder(
                               borderRadius: BorderRadius.circular(8),
                               borderSide: BorderSide(
                                   width: 2, color: Color(0xFFD5D5D5)),
                             ),
                           ),
                         ),
                       ),
                     ),
                     SizedBox(height: 20,),
                     Text(
                       "Explore Menu",
                       style: TextStyle(
                         color: Color(0xFF4D5E47),
                         fontSize: 25,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ],
                 ),
               ),
               Expanded(
                 child:Padding(
                   padding: EdgeInsets.all(10),
                   child: GridView.builder(
                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 3,
                       crossAxisSpacing: 16,
                       mainAxisSpacing: 16,
                       childAspectRatio: 1,
                     ),
                     itemCount: ItemsMenu.length,
                     itemBuilder: (context, index) {
                       final item = ItemsMenu[index];
                       return GestureDetector(
                         onTap: () {
                           setState(() {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderView()));
                           });

                         },
                         child: Column(
                           children: [
                           Container(
                             height:82,
                             width: 100,
                             decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(12),
                             ),
                             child:Padding(
                                 padding: const EdgeInsets.all(10.0),
                                 child: Image.asset(item["image"]!),
                               ),
                           ),
                                   Text(
                                     item["name"]!,
                                     style: TextStyle(color: Color(0xFF4E5D3B)),
                                   ),

                           ],
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
