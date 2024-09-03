import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';
import '../pages/item_detail_page.dart';
import 'package:kalkulator_flutter/model/model_datar.dart';

class AdapterList extends StatelessWidget {
  final ModelDatar modelDatar;
  const AdapterList({super.key, required this.modelDatar});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: SizedBox(
          width: 75,
          height: 60,
          child: Image.asset(
            modelDatar.image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              print('Error loading image: $error');
              return const Icon(Icons.image_not_supported);
            },
          ),
        ),
        title: Text(
          modelDatar.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Provider.of<ItemProvider>(context, listen: false).selectItem(modelDatar);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ItemDetailPage()),
          );
        },
      ),
    );
  }
}