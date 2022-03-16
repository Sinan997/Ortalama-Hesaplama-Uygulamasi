import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama2/constants/constants.dart';

class OrtalamaGoster extends StatelessWidget {
  final int dersSayisi;
  final double ortalama;
  const OrtalamaGoster(
      {required this.dersSayisi, required this.ortalama, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? "$dersSayisi Ders Girildi" : "Ders Seçiniz",
          style: Sabitler.ortalamaGosterBody,
        ),
        Text(
          ortalama >= 0 ? ortalama.toStringAsFixed(2) : "0",
          style: Sabitler.ortalamaGoster,
        ),
        Text(
          "Ortalama",
          style: Sabitler.ortalamaGosterBody,
        ),
      ],
    );
  }
}
