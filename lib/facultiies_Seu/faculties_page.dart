import 'package:flutter/material.dart';
import 'package:seustudyassist/facultiies_Seu/faculties_row.dart';
import 'package:seustudyassist/model/faculties_list.dart';

class FacultiesPage extends StatefulWidget {
  const FacultiesPage({Key? key}) : super(key: key);

  @override
  State<FacultiesPage> createState() => _FacultiesPageState();
}

class _FacultiesPageState extends State<FacultiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faculties Page"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: faculties.length, // Use the faculties list here
              itemBuilder: (context, index) {
                return customersRow(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
