import 'package:flutter/material.dart';
import 'package:kalkulator_flutter/listViewPages/list_view_ruang.dart';
import 'package:kalkulator_flutter/listViewPages/listview.dart';
import 'package:kalkulator_flutter/providers/type_provider.dart';
import 'package:provider/provider.dart';
import 'package:kalkulator_flutter/model/model_type.dart';

class Mainadapterlist extends StatelessWidget {
  final ModelType modelType;
  const Mainadapterlist({super.key, required this.modelType});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: SizedBox(
          width: 60,
          height: 60,
          child: Image.asset(
            modelType.image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              print('Error loading image: $error');
              return const Icon(Icons.image_not_supported);
            },
          ),
        ),
        title: Text(
          modelType.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Provider.of<TypeProvider>(context, listen: false).selectItem(modelType);
          if(modelType.name == "Bangun Datar"){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CustomListViewDatar()),
            );
          }
          else if(modelType.name == "Bangun Ruang"){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CustomListViewRuang()),
            );
          }
        },
      ),
    );
  }
}