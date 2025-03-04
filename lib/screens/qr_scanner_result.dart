import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rumailah/screens/qr_scanner.dart';
class QrScannerResult extends StatefulWidget {
  final String qrResult;
  const QrScannerResult({super.key,required this.qrResult});

  @override
  State<QrScannerResult> createState() => _QrScannerResultState();
}

class _QrScannerResultState extends State<QrScannerResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Scanner Result",style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),),
        ),
        body:Container(
          color: Color(0xFFF7F6F6),
          child: Center(
            child: Column(
              children: [
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
                            data: widget.qrResult,
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
                      Text(widget.qrResult,style: TextStyle(
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
                  width: 150,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: widget.qrResult));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Copied the Result")),
                      );
                    },
                    child: const Text(
                      "Copy Result",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
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
                     Navigator.pop(context);
                    },
                    child: const Text(
                      "Scan Again",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
