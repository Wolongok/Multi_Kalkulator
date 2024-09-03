import 'package:flutter/material.dart';
import 'package:kalkulator_flutter/listViewPages/mainListView.dart';
import 'package:kalkulator_flutter/providers/item_provider_aritmatik.dart';
import 'package:kalkulator_flutter/providers/item_provider_ruang.dart';
import 'package:kalkulator_flutter/providers/type_provider.dart';
import 'package:kalkulator_flutter/providers/value_provider.dart';
import 'package:provider/provider.dart';
import 'package:kalkulator_flutter/providers/item_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ValueProvider()),
        ChangeNotifierProvider(create: (_) => ItemProvider()),
        ChangeNotifierProvider(create: (_) => TypeProvider()),
        ChangeNotifierProvider(create: (_) => ItemProviderRuang()),
        ChangeNotifierProvider(create: (_) => ItemProviderAritmatik()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CustomMainListView(),
    );
  }
}
