import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          Provider.of<TypeProvider>(context, listen: false)
              .selectItem(modelType);

          // Using GoRouter for navigation based on modelType.name
          if (modelType.name == "Bangun Datar") {
            context.push('/datar');
          } else if (modelType.name == "Bangun Ruang") {
            context.push('/ruang');
          } else if (modelType.name == "Aritmatika") {
            context.push('/aritmatika');
          } else if (modelType.name == "Perpangkatan") {
            context.push('/pangkat');
          }
        },
      ),
    );
  }
}
