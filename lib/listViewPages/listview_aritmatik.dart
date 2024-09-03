import 'package:flutter/material.dart';
import 'package:kalkulator_flutter/componentPage/adapterList_aritmatik.dart';
import 'package:kalkulator_flutter/model/model_aritmatik.dart';

class CustomAritmatika extends StatefulWidget {
  const CustomAritmatika({super.key});

  @override
  State<CustomAritmatika> createState() => _CustomAritmatikaState();
}

class _CustomAritmatikaState extends State<CustomAritmatika> {
  List<ModelAritmatika> dataruang = [
    ModelAritmatika(name: "Tambah", image: "images/tambah.png"),
    ModelAritmatika(name: "Kurang", image: "images/kurang.png"),
    ModelAritmatika(name: "kali", image: "images/kali.png"),
    ModelAritmatika(name: "bagi", image: "images/bagi.png"),
    ModelAritmatika(name: "modulus", image: "images/modulus.png"),
  ];

  @override
  void initState() {
    super.initState();
    for (var bangun in dataruang) {
      print('Name: ${bangun.name}, Image Path: ${bangun.image}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Bangun Datar"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView.builder(
          itemCount: dataruang.length,
          itemBuilder: (context, index) {
            return AdapterlistAritmatik(modelAritmatika: dataruang[index]);
          },
        ),
      ),
    );
  }
}
