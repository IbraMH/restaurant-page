import 'package:flutter/material.dart';

class ElevatedButtonApp extends StatelessWidget {
  final String text;
  final String image;
  final double widthBtn;
  final double heightBtn;
  final void Function()? onTap;


  ElevatedButtonApp({
    required this.text,
    required this.image,
    this.onTap,
    this.widthBtn = 60,
    this.heightBtn = 50,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        minimumSize: Size(widthBtn, heightBtn),
        primary: Color(0xffFFF3D0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: onTap,
      child: Row(
        children: [
          Image.asset(image ,width: 20, height: 20,),
          SizedBox(width: 5),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
