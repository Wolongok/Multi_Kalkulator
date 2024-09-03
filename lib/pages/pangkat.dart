// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:kalkulator_flutter/providers/value_provider.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';
import 'package:flutter/services.dart';
import 'dart:math';

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
              child: (TextField(
                controller: inputSatu,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF000000), width: 1)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF777777), width: 1)),
                    contentPadding:
                        EdgeInsets.only(top: 5, left: 15, bottom: -12)),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                ],
              )),
            ),
            Container(
              width: 200,
              child: (TextField(
                controller: inputDua,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF000000), width: 1)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF777777), width: 1)),
                    contentPadding:
                        EdgeInsets.only(top: 5, left: 15, bottom: -12)),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                ],
              )),
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
