import 'package:flutter/material.dart';
import 'package:kalkulator_flutter/componentPage/adapterList.dart';
import 'model/model.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  List<ModelRuang> dataruang = [
    ModelRuang(name: "Persegi", image: "images/persegi.png"),
    ModelRuang(name: "Persegi Panjang", image: "images/persegiPanjang.png"),
    ModelRuang(name: "Lingkaran", image: "images/lingkaran.png"),
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
            return AdapterList(modelRuang: dataruang[index]);
          },
        ),
      ),
    );
  }
}
