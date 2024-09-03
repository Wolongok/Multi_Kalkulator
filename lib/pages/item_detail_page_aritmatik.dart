import 'package:flutter/material.dart';
import 'package:kalkulator_flutter/providers/item_provider_aritmatik.dart';
import 'package:kalkulator_flutter/providers/value_provider.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider_datar.dart';
import 'package:flutter/services.dart';

import '../reuseable_componenet/my_text_field.dart';

class ItemDetailPageAritmatik extends StatefulWidget {
  const ItemDetailPageAritmatik({super.key});

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPageAritmatik> {
  final TextEditingController inputSatu = TextEditingController();
  final TextEditingController inputDua = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final selectedItem =
        Provider.of<ItemProviderAritmatik>(context).selectedItem;
    final valueProvider = context.read<ValueProvider>();

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        valueProvider.resetValue();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: Text(selectedItem?.name ?? 'Item Detail'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (selectedItem != null) ...[
                Image.asset(
                  selectedItem.image,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Text(
                  selectedItem.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 200,
                    child: MyTextField(controller: inputSatu,
                      hintText: 'Enter a number',
                      isNumberInput: true,
                      allowDecimal: true,)
                ),
                SizedBox(
                  width: 200,
                    child: MyTextField(controller: inputDua,
                      hintText: 'Enter a number',
                      isNumberInput: true,
                      allowDecimal: true,)
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedItem.name == "Tambah") {
                      valueProvider.caladd(
                        double.parse(inputSatu.text),
                        double.parse(inputDua.text),
                      );
                    } else if (selectedItem.name == "Kurang") {
                      valueProvider.calkurang(
                        double.parse(inputSatu.text),
                        double.parse(inputDua.text),
                      );
                    } else if (selectedItem.name == "kali") {
                      valueProvider.calmultyplay(
                        double.parse(inputSatu.text),
                        double.parse(inputDua.text),
                      );
                    } else if (selectedItem.name == "bagi") {
                      valueProvider.caldivide(
                        double.parse(inputSatu.text),
                        double.parse(inputDua.text),
                      );
                    } else if (selectedItem.name == "modulus") {
                      valueProvider.calmodulus(
                        double.parse(inputSatu.text),
                        double.parse(inputDua.text),
                      );
                    }
                  },
                  child: const Text('Hitung'),
                ),
                const SizedBox(height: 20),
                Text(
                  context.watch<ValueProvider>().value,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
              ] else
                const Text('No item selected'),
            ],
          ),
        ),
      ),
    );
  }
}
