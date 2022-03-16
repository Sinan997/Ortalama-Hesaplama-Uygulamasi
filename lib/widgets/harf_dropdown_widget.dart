import 'package:flutter/material.dart';
import 'package:ortalama_hesaplama2/constants/constants.dart';
import 'package:ortalama_hesaplama2/helper/data_helper.dart';

class HarfDropDownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropDownWidget({required this.onHarfSecildi, Key? key})
      : super(key: key);

  @override
  _HarfDropDownWidgetState createState() => _HarfDropDownWidgetState();
}

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
  double secilenHarfDeger = 4;
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
            value: secilenHarfDeger,
            onChanged: (newValue) {
              setState(() {
                secilenHarfDeger = newValue!;
                widget.onHarfSecildi(newValue);
              });
            },
            items: DataHelper.tumDerslerinHarfleri()),
      ),
    );
  }
}
