import 'package:flutter/material.dart';
import 'package:kalkulator_flutter/providers/value_provider.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';
import 'package:flutter/services.dart';

class ItemDetailPage extends StatefulWidget {
  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
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
                  width: 270,
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
                  child: TextField(
                    controller: inputSatu,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF000000), width: 1),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF777777), width: 1),
                      ),
                      contentPadding: EdgeInsets.only(top: 5, left: 15, bottom: -12),
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                    ],
                  ),
                ),
                if (selectedItem.name == "Persegi Panjang")
                  Container(
                    width: 200,
                    child: TextField(
                      controller: inputDua,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF000000), width: 1),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF777777), width: 1),
                        ),
                        contentPadding: EdgeInsets.only(top: 5, left: 15, bottom: -12),
                      ),
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                      ],
                    ),
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
