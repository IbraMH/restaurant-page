import 'package:flutter/material.dart';

class CardTime extends StatelessWidget {
  final String time;
  final Color backColor;
  final void Function()? onTap;
  final double widthBord;
  final Color colorBord;

  CardTime({
    required this.time,
    this.backColor = Colors.white,
    this.onTap,
    this.widthBord = 0,
    this.colorBord = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: backColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          side: BorderSide(
            color: colorBord,
            width: widthBord,
          )
        ),
        child: Center(
          child: Text(
            time,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
