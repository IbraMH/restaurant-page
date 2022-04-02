import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matamy/elevated_button_app.dart';

class AlertDialogFun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return showAlertDialog(context);
  }

  AlertDialog showAlertDialog(
    BuildContext context, {
    // required String title,
    // required String descriptios,
    VoidCallback? confirmFun,
  }) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.only(left: 20,right: 20,bottom: 15,top: 15),
      // buttonPadding: EdgeInsets.only(left: 15,right: 15,bottom: 5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Colors.blueAccent.shade700,
            width: 2,
          )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('عائلة',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blueAccent.shade700),),
                SizedBox(width: 25),
                Text(':نوع الحجز',textAlign: TextAlign.end,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),

              ],

            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('4',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blueAccent.shade700),),
              SizedBox(width: 12),
              Text(':عدد الأشخاص',textAlign: TextAlign.end,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),


            ],

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('الخميس 31/03/2022',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blueAccent.shade700),),
              SizedBox(width: 6),
              Text(':اليوم و التاريخ',textAlign: TextAlign.end,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),
            ],

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('الساعة',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blueAccent.shade700),),
              SizedBox(width: 30),
              Text(':وقت الحجز',textAlign: TextAlign.end,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),

            ],

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('F-16',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blueAccent.shade700),),
              SizedBox(width: 25),
              Text(':رقم الطاولة',textAlign: TextAlign.end,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),


            ],

          ),

        ],
      ),

      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButtonApp(text: 'تاكيد الحجز',image: 'images/200.png',widthBtn: 50, heightBtn: 50,onTap: (){},),
            SizedBox(width: 10),
            ElevatedButtonApp(text: 'الغاء الحجز',image: 'images/201.png',widthBtn: 50, heightBtn: 50,onTap: (){
              Navigator.pop(context);
            },),
          ],
        ),

      ],
    );
  }
}
