import 'package:flutter/material.dart';

class ReusableWidgets extends StatelessWidget {
  final String title;
  final String subTitle;
  const ReusableWidgets({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21,right: 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: const TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.bold
          ),),
          Text(subTitle,style: const TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),)
        ],
      ),
    );
  }
}
