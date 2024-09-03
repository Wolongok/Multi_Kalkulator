import 'package:flutter/material.dart';
import 'package:kalkulator_flutter/componentPage/adapterList.dart';
import 'package:kalkulator_flutter/providers/type_provider.dart';
import 'package:provider/provider.dart';
import '../model/model_datar.dart';

class CustomListViewDatar extends StatefulWidget {
  const CustomListViewDatar({super.key});


  @override
  State<CustomListViewDatar> createState() => _CustomListViewDatarState();
}

class _CustomListViewDatarState extends State<CustomListViewDatar> {
  List<ModelDatar> modelDatar = [
    ModelDatar(name: "Persegi", image: "images/persegi.png"),
    ModelDatar(name: "Persegi Panjang", image: "images/persegiPanjang.png"),
    ModelDatar(name: "Lingkaran", image: "images/lingkaran.png"),
  ];

  @override
  void initState() {
    super.initState();
    for (var bangun in modelDatar) {
      print('Name: ${bangun.name}, Image Path: ${bangun.image}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedType = Provider.of<TypeProvider>(context).selectedType;
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedType?.name ?? 'Default Title'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView.builder(
          itemCount: modelDatar.length,
          itemBuilder: (context, index) {
            return AdapterList(modelDatar: modelDatar[index]);
          },
        ),
      ),
    );
  }
}
