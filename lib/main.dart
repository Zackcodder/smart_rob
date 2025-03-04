import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_rob/core/constants/colors.dart';

import 'providers/country_provider.dart';
import 'screens/onbarding_screens.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountryProvider()),
      ],
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Niklaar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kcDeepBlue),
        useMaterial3: true,
      ),
      home:  OnbardingScreens(),
    );
  }
}
