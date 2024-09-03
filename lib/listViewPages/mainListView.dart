import 'package:flutter/material.dart';
import 'package:kalkulator_flutter/componentPage/mainAdapterList.dart';
import 'package:kalkulator_flutter/model/model_type.dart';

class CustomMainListView extends StatefulWidget {
  const CustomMainListView({super.key});

  @override
  State<CustomMainListView> createState() => _CustomMainListViewState();
}

class _CustomMainListViewState extends State<CustomMainListView> {
  List<ModelType> dataCalculate = [
    ModelType(name: "Aritmatika", image: "images/aritmatika.png"),
    ModelType(name: "Bangun Datar", image: "images/persegi.png"),
    ModelType(name: "Bangun Ruang", image: "images/cube.png"),
    ModelType(name: "Perpangkatan", image: "images/pangkat.png"),
  ];

  @override
  void initState() {
    super.initState();
    for (var jenis in dataCalculate) {
      print('Name: ${jenis.name}, Image Path: ${jenis.image}');
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
          itemCount: dataCalculate.length,
          itemBuilder: (context, index) {
            return Mainadapterlist(modelType: dataCalculate[index]);
          },
        ),
      ),
    );
  }
}
