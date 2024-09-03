import 'package:flutter/material.dart';
import 'package:kalkulator_flutter/componentPage/adapterList.dart';
import 'package:kalkulator_flutter/model/model_datar.dart';


class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  List<ModelDatar> datarModel = [
    ModelDatar(name: "Persegi", image: "images/persegi.png"),
    ModelDatar(name: "Persegi Panjang", image: "images/persegiPanjang.png"),
    ModelDatar(name: "Lingkaran", image: "images/lingkaran.png"),

  ];

  @override
  void initState() {
    super.initState();
    for (var bangun in datarModel) {

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
          itemCount: datarModel.length,
          itemBuilder: (context, index) {
            return AdapterList(modelDatar: datarModel[index]);

          },
        ),
      ),
    );
  }
}
