import 'package:flutter/material.dart';

class TitledNavigationBarItem {

  final String title;
  final IconData icon;

 Color? color;



  final Color backgroundColor;

  TitledNavigationBarItem( {
     this.color, 
    required this.title,
    required this.icon,
    this.backgroundColor = Colors.white,
  });
}