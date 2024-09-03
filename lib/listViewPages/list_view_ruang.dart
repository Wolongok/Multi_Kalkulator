import 'package:flutter/material.dart';
import 'package:kalkulator_flutter/componentPage/adapterListRuang.dart';
import 'package:kalkulator_flutter/model/model_ruang.dart';

class CustomListViewRuang extends StatefulWidget {
  const CustomListViewRuang({super.key});

  @override
  State<CustomListViewRuang> createState() => _CustomListViewRuangState();
}

class _CustomListViewRuangState extends State<CustomListViewRuang> {
  List<ModelRuang> modelRuang = [
    ModelRuang(name: "Kubus", image: "images/cube.png"),
    ModelRuang(name: "Kerucut", image: "images/cone.webp"),
    ModelRuang(name: "Bola", image: "images/ball.png"),
  ];

  @override
  void initState() {
    super.initState();
    for (var bangun in modelRuang) {
      print('Name: ${bangun.name}, Image Path: ${bangun.image}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Bangun Ruang"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView.builder(
          itemCount: modelRuang.length,
          itemBuilder: (context, index) {
            return Adapterlistruang(modelRuang: modelRuang[index]);
          },
        ),
      ),
    );
  }
}
