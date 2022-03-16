import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama2/constants/constants.dart';
import 'package:ortalama_hesaplama2/widgets/home_page_sayfasi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Sabitler.baslik,
      theme: ThemeData(
          primarySwatch: Sabitler.temaColor,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomePageSayfasi(),
    );
  }
}
