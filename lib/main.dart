import 'package:flutter/material.dart';
import 'package:inputfield/input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('form'),
          backgroundColor: Colors.blue.shade200,
        ),
        body: const Input(),
      ),
    );
  }
}
