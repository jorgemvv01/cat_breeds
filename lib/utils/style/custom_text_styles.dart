import 'package:flutter/material.dart';

class CustomTextStyles {

  static TextStyle titleH1(
      {Color? color, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Poppins',
      fontSize: 22,
    );
  }

  static TextStyle titleH2(
      {Color? color, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Poppins',
      fontSize: 18,
    );
  }

  static TextStyle titleH3(
      {Color? color, bool isBold = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Poppins',
      fontSize: 16,
    );
  }

  static TextStyle paragraph(
      {Color? color, bool isBold = false, bool lineThrough = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Poppins',
      fontSize: 15,
      decoration: lineThrough ? TextDecoration.lineThrough : null
    );
  }

  static TextStyle smallParagraph(
      {Color? color, bool isBold = false, bool lineThrough = false}) {
    return TextStyle(
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontFamily: 'Poppins',
      fontSize: 13,
      decoration: lineThrough ? TextDecoration.lineThrough : null
    );
  }
}
