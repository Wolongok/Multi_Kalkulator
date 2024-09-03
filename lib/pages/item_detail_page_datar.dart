import 'package:flutter/material.dart';
import 'package:kalkulator_flutter/providers/value_provider.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider_datar.dart';
import 'package:flutter/services.dart';

import '../reuseable_componenet/my_text_field.dart';

class ItemDetailPageDatar extends StatefulWidget {
  const ItemDetailPageDatar({super.key});

  @override
  _ItemDetailPageDatarState createState() => _ItemDetailPageDatarState();
}

class _ItemDetailPageDatarState extends State<ItemDetailPageDatar> {
  final TextEditingController inputSatu = TextEditingController();
  final TextEditingController inputDua = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final selectedItem = Provider.of<ItemProvider>(context).selectedItem;
    final valueProvider = context.read<ValueProvider>();

    return WillPopScope(
      onWillPop: () async {
        // Reset the value when user navigates back
        valueProvider.resetValue();
        return true; // Allow the page to be popped
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
                  width: 270,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Text(
                  selectedItem.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 200,
                    child: MyTextField(controller: inputSatu,
                      hintText: 'Enter a number',
                      isNumberInput: true,
                      allowDecimal: true,)
                ),
                if (selectedItem.name == "Persegi Panjang")
                  SizedBox(
                    width: 200,
                      child: MyTextField(controller: inputDua,
                        hintText: 'Enter a number',
                        isNumberInput: true,
                        allowDecimal: true,)
                  ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedItem.name == "Persegi") {
                      valueProvider.calculatePersegi(double.parse(inputSatu.text));
                    } else if (selectedItem.name == "Persegi Panjang") {
                      valueProvider.calculateSegiPanjang(
                        double.parse(inputSatu.text),
                        double.parse(inputDua.text),
                      );
                    } else if (selectedItem.name == "Lingkaran") {
                      valueProvider.calculateLingkaran(double.parse(inputSatu.text));
                    }
                  },
                  child: const Text('Hitung'),
                ),
                const SizedBox(height: 20),
                Text(
                  context.watch<ValueProvider>().value,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
