import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_ui/views/home/home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: FurnitureUI(),
    ),
  );
}

class FurnitureUI extends StatelessWidget {
  const FurnitureUI({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}
