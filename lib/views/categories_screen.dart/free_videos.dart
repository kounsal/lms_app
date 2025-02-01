import 'package:flutter/material.dart';

class FreeClassesScreen extends StatefulWidget {
  const FreeClassesScreen({super.key});

  @override
  State<FreeClassesScreen> createState() => _FreeClassesScreenState();
}

class _FreeClassesScreenState extends State<FreeClassesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free Classes'),
      ),
    );
  }
}