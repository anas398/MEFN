import 'package:flutter/material.dart';

class VendorScreen extends StatelessWidget {
  static const String id = '\vendorscreen';
  const VendorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Vendor"),
      ),
    );
  }
}
