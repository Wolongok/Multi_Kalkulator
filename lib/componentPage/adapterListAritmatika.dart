import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kalkulator_flutter/model/model_aritmatik.dart';
import 'package:kalkulator_flutter/pages/item_detail_page_aritmatik.dart';
import 'package:kalkulator_flutter/providers/item_provider_aritmatik.dart';
import 'package:provider/provider.dart';
import '../pages/item_detail_page_datar.dart'; // Create this file next

class AdapterlistAritmatik extends StatelessWidget {
  final ModelAritmatika modelAritmatika;
  const AdapterlistAritmatik({super.key, required this.modelAritmatika});

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
          height: 75,
          child: Image.asset(
            modelAritmatika.image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              print('Error loading image: $error');
              return const Icon(Icons.image_not_supported);
            },
          ),
        ),
        title: Text(
          modelAritmatika.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Provider.of<ItemProviderAritmatik>(context, listen: false)
              .selectItem(modelAritmatika);
          context.push('/itp_aritmatik');
        },
      ),
    );
  }
}
