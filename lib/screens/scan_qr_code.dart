import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rumailah/screens/qr_scanner.dart';
class ScanQrCode extends StatefulWidget {

  const ScanQrCode({super.key,});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Scan QR',style: TextStyle(color: Color(0xFF6E7075)),),
      ),
      body:Container(
        color: Color(0xFFF7F6F6),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
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
                SizedBox(height: 20,),
                Container(
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40,),
                          Container(
                            child: Center(
                              child: QrImageView(
                                data: "hello",
                                version: QrVersions.auto,
                                size: 260,
                                backgroundColor: Colors.white,
                                eyeStyle: QrEyeStyle(
                                  eyeShape: QrEyeShape.square,
                                  color: Color(0xFF4D5E47),
                                ),
                                dataModuleStyle: QrDataModuleStyle(
                                  dataModuleShape: QrDataModuleShape.square,
                                  color: Color(0xFF4D5E47),
                                ),
                              ),
                            ),
                            // child: Image.asset("assets/images/scanQR/qr.png"),
                          ),
                      SizedBox(height: 10),
                      Text("Hello",style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF4D5E47),
                      ),),
                      SizedBox(height: 30),
                      Container(
                        width: 290,
                        child: DottedLine(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          lineLength: double.infinity,
                          lineThickness: 2.0,
                          dashLength: 15.0,
                          dashColor: Color(0xFFADABB0),
                          dashGapLength: 15.0,
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        child: Text("About scan QR code:",style: TextStyle(color: Color(0xFF26375F),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),),
                      ),
                      Container(
                        child: Text("Scan QR code to Redeem Offer",style: TextStyle(color: Color(0xFF26375F),
                        fontSize: 16),),
                      ),
                      Container(
                        child: Text("Scan QR code to Participate in a points",style: TextStyle(color: Color(0xFF26375F),
                        fontSize: 16),),
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 320,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: Color(0xFF4D5E47),
                        foregroundColor: Colors.white),
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => QrScanner(),));
                    },
                    child: const Text(
                      "Scan",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 140,),
              ],
            ),
          ),
        ),
      )
    );
  }
}
