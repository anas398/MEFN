import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static const String id = '\productscreen';
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Product"),
      ),
    );;
  }
}