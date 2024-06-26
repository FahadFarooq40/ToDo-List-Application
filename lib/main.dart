import 'package:flutter/material.dart';
import 'package:tubo_app/tubo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tubo Application',
      home: TudoApp(),
    );
  }
}
