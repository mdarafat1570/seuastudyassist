import 'package:flutter/material.dart';

class SEUMapPage extends StatefulWidget {
  const SEUMapPage({super.key});

  @override
  State<SEUMapPage> createState() => _SEUMapPageState();
}

class _SEUMapPageState extends State<SEUMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Map SEU",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
    );
  }
}
