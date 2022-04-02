import 'package:flutter/material.dart';

class ColumnTypeRes extends StatelessWidget {
  final String image;
  final String type;
  final Color imageColor;
  final void Function()? onTap;

  ColumnTypeRes(
      {required this.image,
      required this.type,
      required this.imageColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: onTap,
            child: Image.asset(
              image,
              width: 45,
              height: 45,
              color: imageColor,
            )), //F49400
        SizedBox(height: 2),
        Text(
          type,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
