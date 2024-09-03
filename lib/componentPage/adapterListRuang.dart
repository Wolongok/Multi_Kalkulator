import 'package:flutter/material.dart';
import 'package:kalkulator_flutter/model/modelruang.dart';
import 'package:kalkulator_flutter/providers/item_provider_ruang.dart';
import 'package:provider/provider.dart';
import '../model/model_datar.dart';
import '../providers/item_provider.dart';
import '../pages/item_detail_page.dart';  // Create this file next

class Adapterlistruang extends StatelessWidget {
  final ModelRuang modelRuang;
  const Adapterlistruang({super.key, required this.modelRuang});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          width: 75,
          height: 60,
          child: Image.asset(
            modelRuang.image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              print('Error loading image: $error');
              return const Icon(Icons.image_not_supported);
            },
          ),
        ),
        title: Text(
          modelRuang.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Provider.of<ItemProviderRuang>(context, listen: false).selectItem(modelRuang);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ItemDetailPage()),
          );
        },
      ),
    );
  }
}