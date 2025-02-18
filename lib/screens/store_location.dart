import 'package:flutter/material.dart';
class StoreLocation extends StatefulWidget {
  const StoreLocation({super.key});

  @override
  State<StoreLocation> createState() => _StoreLocationState();
}

class _StoreLocationState extends State<StoreLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Store Locations"),
      ),
    );
  }
}
