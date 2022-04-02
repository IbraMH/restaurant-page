import 'package:flutter/material.dart';
import 'package:matamy/reservation_screen.dart';

void main(){
  runApp(MainApp());
}



class MainApp extends StatefulWidget {

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReservationScreen(),
    );
  }
}
