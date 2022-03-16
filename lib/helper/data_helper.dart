import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama2/model/ders.dart';

class DataHelper {
  static List<Ders> tumEklenenDersler = [];
  static dersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;
    for (var element in tumEklenenDersler) {
      toplamNot = toplamNot + (element.krediDegeri * element.harfDegeri);
      toplamKredi += element.krediDegeri;
    }
    return toplamNot / toplamKredi;
  }

  static List<String> notlar = [
    "AA",
    "BA",
    "BB",
    "CB",
    "CC",
    "DC",
    "DD",
    "FD",
    "FF"
  ];
  static List<int> _tumKrediler() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3;
      case "CB":
        return 2.5;
      case "CC":
        return 2;
      case "DC":
        return 1.5;
      case "DD":
        return 1;
      case "FD":
        return 0.5;
      case "FF":
        return 0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return notlar
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _harfiNotaCevir(e),
            ))
        .toList();
  }

  static List<DropdownMenuItem<double>> tumDerslerinKredileri() {
    return _tumKrediler()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }
}
