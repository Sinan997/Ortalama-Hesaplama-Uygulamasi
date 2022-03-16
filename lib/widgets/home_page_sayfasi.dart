import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama2/constants/constants.dart';
import 'package:ortalama_hesaplama2/helper/data_helper.dart';
import 'package:ortalama_hesaplama2/model/ders.dart';
import 'package:ortalama_hesaplama2/widgets/ders_listesi.dart';
import 'package:ortalama_hesaplama2/widgets/harf_dropdown_widget.dart';
import 'package:ortalama_hesaplama2/widgets/kredi_dropdown_widget.dart';
import 'package:ortalama_hesaplama2/widgets/ortalama_goster.dart';

class HomePageSayfasi extends StatefulWidget {
  const HomePageSayfasi({Key? key}) : super(key: key);

  @override
  _HomePageSayfasiState createState() => _HomePageSayfasiState();
}

class _HomePageSayfasiState extends State<HomePageSayfasi> {
  double secilenHarfDeger = 4;
  double secilenKrediDeger = 1;
  String? girilenDersAdi;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          Sabitler.baslik,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                flex: 2,
                child: buildForm(),
              ),
              Expanded(
                  flex: 1,
                  child: OrtalamaGoster(
                      dersSayisi: DataHelper.tumEklenenDersler.length,
                      ortalama: DataHelper.ortalamaHesapla())),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: DersListesi(
              onElemanCikarma: (index) {
                DataHelper.tumEklenenDersler.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: buildTextFormField(),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: HarfDropDownWidget(onHarfSecildi: (newValue) {
                    secilenHarfDeger = newValue;
                  }),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: KrediDropDownWidget(onKrediSecildi: (newValue) {
                    secilenKrediDeger = newValue;
                  }),
                ),
              ),
              IconButton(
                  onPressed: _dersEkleVeOrtalamaHesapla,
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Sabitler.temaColor,
                    size: 30,
                  )),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTextFormField() {
    return TextFormField(
      onSaved: (dersAdi) {
        setState(() {
          girilenDersAdi = dersAdi;
        });
      },
      validator: (s) {
        if (s!.isEmpty) {
          return "Ders Adı Girin";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: "Matematik",
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.temaColor.shade100.withOpacity(0.4)),
    );
  }

  void _dersEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi!,
          harfDegeri: secilenHarfDeger,
          krediDegeri: secilenKrediDeger);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}
