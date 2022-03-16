import 'package:flutter/material.dart';

class Sabitler {
  static const MaterialColor temaColor = Colors.indigo;

  static const String baslik = "Ortalama Hesaplama";

  static BorderRadius borderRadius = BorderRadius.circular(24);

  static TextStyle ortalamaGosterBody = TextStyle(
      fontSize: 16, color: Sabitler.temaColor, fontWeight: FontWeight.w700);

  static TextStyle ortalamaGoster = TextStyle(
      fontSize: 55, color: Sabitler.temaColor, fontWeight: FontWeight.w600);

  static const EdgeInsetsGeometry dropDownPadding =
      EdgeInsets.symmetric(horizontal: 14, vertical: 6);
}
