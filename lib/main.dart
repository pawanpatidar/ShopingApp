import 'package:flutter/material.dart';
import 'package:shoping_app/screens/category/ui/category.dart';
import 'package:shoping_app/screens/home/homePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
