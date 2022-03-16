import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama2/constants/constants.dart';
import 'package:ortalama_hesaplama2/helper/data_helper.dart';

class KrediDropDownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  const KrediDropDownWidget({required this.onKrediSecildi, Key? key})
      : super(key: key);

  @override
  _KrediDropDownWidgetState createState() => _KrediDropDownWidgetState();
}

class _KrediDropDownWidgetState extends State<KrediDropDownWidget> {
  double secilenKrediDeger = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.temaColor.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<double>(
            iconEnabledColor: Sabitler.temaColor.shade400,
            alignment: Alignment.center,
            value: secilenKrediDeger,
            onChanged: (newValue) {
              setState(() {
                secilenKrediDeger = newValue!;
                widget.onKrediSecildi(newValue);
              });
            },
            items: DataHelper.tumDerslerinKredileri()),
      ),
    );
  }
}
