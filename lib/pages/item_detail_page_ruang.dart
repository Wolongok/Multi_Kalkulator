import 'package:flutter/material.dart';
import 'package:kalkulator_flutter/reuseable_componenet/my_text_field.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider_ruang.dart';
import 'package:flutter/services.dart';
import '../providers/value_provider.dart';

class ItemDetailPageRuang extends StatefulWidget {
  const ItemDetailPageRuang({super.key});

  @override
  _ItemDetailPageStateRuang createState() => _ItemDetailPageStateRuang();
}

class _ItemDetailPageStateRuang extends State<ItemDetailPageRuang> {
  final TextEditingController inputSatu = TextEditingController();
  final TextEditingController inputDua = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final selectedItem = Provider.of<ItemProviderRuang>(context).selectedItem;
    final valueProvider = context.read<ValueProvider>();

    return WillPopScope(
      onWillPop: () async {
        // Reset the value when user navigates back
        valueProvider.resetValue();
        return true; // Allow the page to be popped
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(),
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
                SizedBox(height: 10),
                Text(
                  selectedItem.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Container(
                    width: 200,
                    child: MyTextField(
                      controller: inputSatu,
                      hintText: 'Enter a number',
                      isNumberInput: true,
                      allowDecimal: true,
                    )),
                if (selectedItem.name == "Kerucut")
                  Container(
                      width: 200,
                      child: MyTextField(
                        controller: inputDua,
                        hintText: 'Enter a number',
                        isNumberInput: true,
                        allowDecimal: true,
                      )),
                ElevatedButton(
                  onPressed: () {
                    if (selectedItem.name == "Kubus") {
                      valueProvider
                          .calculateKubus(double.parse(inputSatu.text));
                    } else if (selectedItem.name == "Kerucut") {
                      valueProvider.calculateKerucut(
                        double.parse(inputSatu.text),
                        double.parse(inputDua.text),
                      );
                    } else if (selectedItem.name == "Bola") {
                      valueProvider.calculateBola(double.parse(inputSatu.text));
                    }
                  },
                  child: Text('Hitung'),
                ),
                SizedBox(height: 20),
                Text(
                  context.watch<ValueProvider>().value,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ] else
                Text('No item selected'),
            ],
          ),
        ),
      ),
    );
  }
}
