import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
import 'package:rumailah/screens/qr_scanner_result.dart';
class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  MobileScannerController mobileController = MobileScannerController();
  bool isFlashOn = false;
  bool isFrontCamera = false;

  void _onDetect(BarcodeCapture capture) {
    if (capture.barcodes.isNotEmpty) {
      final qrCode = capture.barcodes.first.rawValue ?? "No Data";
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QrScannerResult(qrResult: qrCode),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            setState(() {
              isFlashOn = !isFlashOn;

            });
            mobileController.toggleTorch();
          }, icon:Icon(Icons.flash_on,color: Colors.grey,)),
          IconButton(onPressed: (){
            setState(() {
              isFrontCamera = !isFrontCamera;
            });
              mobileController.switchCamera();

          }, icon:Icon(Icons.camera_front,color: isFrontCamera ? Colors.blue : Colors.grey,)),
        ],
        iconTheme: IconThemeData(color: Colors.black),
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("QR Scanner",style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets .all(16),
        child: Column(
          children: [
            Expanded(child: Container(
              child: Column(
                children: [
                  Text("Place the QR Code in the area",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),),
                  SizedBox(height: 10,),
                  Text("Scanning will be started automatically",style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),),
                ],
              ),)),
            Expanded(
              flex:6,
                child:Stack(
                  children: [
                    MobileScanner(
                      controller: mobileController,
                      onDetect: _onDetect,
                    ),
                    QRScannerOverlay(overlayColor: Colors.transparent,)
                  ],
                ),
            ),
            Expanded(
                child: Container(
                  alignment: Alignment.center,
                child: Text("Developed By qkWyne",style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  letterSpacing: 1,
                ),),)),
          ],
        ),
      ),
    );
  }
}
