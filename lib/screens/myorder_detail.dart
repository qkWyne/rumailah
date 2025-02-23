import 'package:flutter/material.dart';
class MyorderDetail extends StatefulWidget {
  const MyorderDetail({super.key,required this.orders});
  final Map<String, dynamic> orders;


  @override
  State<MyorderDetail> createState() => _MyorderDetailState();
}

class _MyorderDetailState extends State<MyorderDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.orders["orderNo"]),
      ),
    );
  }
}
