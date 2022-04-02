import 'package:flutter/material.dart';

class ContainerRow extends StatelessWidget {
  final String image;
  final String text;
  final Color mainContainerColor;

  ContainerRow({
    required this.image,
    required this.text,
    required this.mainContainerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          width: 75,
          height: 75,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 40,
                height: 40,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 65,
          height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: mainContainerColor,
          ),
        ),
      ],
    );
  }
}
