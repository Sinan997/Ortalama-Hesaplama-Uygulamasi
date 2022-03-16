import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama2/constants/constants.dart';
import 'package:ortalama_hesaplama2/helper/data_helper.dart';
import 'package:ortalama_hesaplama2/model/ders.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarma;
  const DersListesi({required this.onElemanCikarma, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                direction: DismissDirection.startToEnd,
                onDismissed: (e) {
                  onElemanCikarma(index);
                },
                key: UniqueKey(),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.temaColor,
                        child: Text((tumDersler[index].harfDegeri *
                                tumDersler[index].krediDegeri)
                            .toStringAsFixed(0)),
                      ),
                      subtitle: Text(
                          "${tumDersler[index].krediDegeri} Kredi , Harf notu ${tumDersler[index].harfDegeri}"),
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: Text(
              "Lütfen Ders ekleyin",
              style: Sabitler.ortalamaGosterBody,
            ),
          );
  }
}
