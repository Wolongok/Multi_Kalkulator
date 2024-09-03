import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kalkulator_flutter/listViewPages/list_view_ruang.dart';
import 'package:kalkulator_flutter/listViewPages/listview.dart';
import 'package:kalkulator_flutter/listViewPages/listview_aritmatik.dart';
import 'package:kalkulator_flutter/listViewPages/mainListView.dart';
import 'package:kalkulator_flutter/pages/pangkat.dart';
import 'package:kalkulator_flutter/providers/item_provider_aritmatik.dart';
import 'package:kalkulator_flutter/providers/item_provider_ruang.dart';
import 'package:kalkulator_flutter/providers/type_provider.dart';
import 'package:kalkulator_flutter/providers/value_provider.dart';
import 'package:provider/provider.dart';
import 'package:kalkulator_flutter/providers/item_provider.dart';

void main() {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const CustomMainListView(),
      ),
      GoRoute(
        path: '/datar',
        builder: (context, state) => const CustomListViewDatar(),
      ),
      GoRoute(
        path: '/ruang',
        builder: (context, state) => const CustomListViewRuang(),
      ),
      GoRoute(
        path: '/aritmatika',
        builder: (context, state) => const CustomAritmatika(),
      ),
      GoRoute(
        path: '/pangkat',
        builder: (context, state) => const pangkatPage(),
      ),
    ],
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ValueProvider()),
        ChangeNotifierProvider(create: (_) => ItemProvider()),
        ChangeNotifierProvider(create: (_) => TypeProvider()),
        ChangeNotifierProvider(create: (_) => ItemProviderRuang()),
        ChangeNotifierProvider(create: (_) => ItemProviderAritmatik()),
      ],
      child: MyApp(router: router),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,  // Use the GoRouter for navigation
    );
  }
}
