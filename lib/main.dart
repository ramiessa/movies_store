import 'package:flutter/material.dart';
import 'package:movies_store/shared/styles/styles.dart';

import 'modules/Start_Screen/Start_Screen.dart';
import 'modules/homeScreen/homeScreen.dart';
import 'modules/loginScreen/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkTheme,
      home: const SafeArea(top: true, child: HomeScreen()),
    );
  }
}
