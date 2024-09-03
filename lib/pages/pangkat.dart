// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:kalkulator_flutter/providers/value_provider.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider_datar.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import '../reuseable_componenet/my_text_field.dart';

class pangkatPage extends StatefulWidget {
  const pangkatPage({super.key});

  @override
  State<pangkatPage> createState() => pangkatPageState();
}

class pangkatPageState extends State<pangkatPage> {
  final TextEditingController inputSatu = TextEditingController();
  final TextEditingController inputDua = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final valueProvider = context.read<ValueProvider>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              "Perpangkatan",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              width: 200,
              child: MyTextField(controller: inputSatu,
              hintText: 'Enter a number',
              isNumberInput: true,
              allowDecimal: true,)
            ),
            Container(
              width: 200,child: MyTextField(controller: inputDua,
              hintText: 'Enter a number',
              isNumberInput: true,
              allowDecimal: true,)
            ),
            ElevatedButton(
                onPressed: () {
                  valueProvider.calPangkat(
                        double.parse(inputSatu.text),
                        double.parse(inputDua.text),
                      );
                },
                child: Text("Hitung")),
            SizedBox(
              height: 20,
            ),
            Text(context.watch<ValueProvider>().value),
            Spacer()
          ],
        ),
      ),
    );
  }
}
