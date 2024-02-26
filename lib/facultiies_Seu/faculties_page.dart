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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Faculties",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: 'Search',
                        isCollapsed: true,
                        contentPadding: const EdgeInsets.all(9),
                        prefixIcon: IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 213, 213, 213)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 158, 210, 253)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: FacultiesLIst().length,
              itemBuilder: (context, index) {
                final fachFacultiesLIst = FacultiesLIst()[index];
                return FacultyRow(
                  fachFacultiesLIst['name'],
                  fachFacultiesLIst['Position'],
                  fachFacultiesLIst['phoneNumber'],
                  fachFacultiesLIst['imageUrl'],
                  fachFacultiesLIst['email'],

                  // onDetailsClick: () {
                  //   // Navigator.push(
                  //   //   context,
                  //   //   MaterialPageRoute(
                  //   //       builder: (context) => PosOrderDetails(ordernumber: '',)),
                  //   // );
                  // },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
