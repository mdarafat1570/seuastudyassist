import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:open_file/open_file.dart';
import 'package:seustudyassist/commonWidget/custom_Text.dart';

class EssayCoverPage extends StatefulWidget {
  @override
  _EssayCoverPageState createState() => _EssayCoverPageState();
}

class _EssayCoverPageState extends State<EssayCoverPage> {
  TextEditingController submittedByNameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  TextEditingController submittedToNameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController submissionDateController = TextEditingController();

  Future<void> generatePDF() async {
    final pdf = pdfLib.Document();
    // final image =
    //     pdfLib.MemoryImage(File('assets/LgoUMS.png').readAsBytesSync());

    pdf.addPage(
      pdfLib.Page(
        build: (context) {
          return pdfLib.Column(
            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
            children: [
              // Add the image container
              // pdfLib.Container(
              //   alignment: pdfLib.Alignment.center,
              //   child: pdfLib.Image('assets/LgoUMS.png' as pdfLib.ImageProvider),
              //   padding: const pdfLib.EdgeInsets.only(bottom: 20.0),
              // ),
              pdfLib.Text(
                'Submitted By',
                style: pdfLib.TextStyle(
                    fontWeight: pdfLib.FontWeight.bold, fontSize: 16),
              ),

              pdfLib.Text('Name: ${submittedByNameController.text}'),
              pdfLib.Text('ID: ${idController.text}'),
              pdfLib.Text('Semester: ${semesterController.text}'),
              pdfLib.Text('Dept: ${deptController.text}'),

              pdfLib.Text(
                'Submitted To',
                style: pdfLib.TextStyle(
                    fontWeight: pdfLib.FontWeight.bold, fontSize: 16),
              ),

              pdfLib.Text('Name: ${submittedToNameController.text}'),
              pdfLib.Text('Designation: ${designationController.text}'),
              pdfLib.Text('Dept: ${deptController.text}'),
              pdfLib.Text('Submitted on: ${DateTime.now().toString()}'),
            ],
          );
        },
      ),
    );

    debugPrint('PDF Generated: $pdf');
    final output = await getTemporaryDirectory();
    final file = File('${output.path}/essay_cover_page.pdf');
    await file.writeAsBytes(await pdf.save());
    debugPrint('PDF File Path: ${file.path}');
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Cover Page",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              commonTextfieldCover(1, submittedByNameController,
                  labelText: 'Submitted By Name'),
              SizedBox(height: 20),
              commonTextfieldCover(1, idController, labelText: 'ID'),
              SizedBox(height: 20),
              commonTextfieldCover(1, semesterController,
                  labelText: 'Semester'),
              SizedBox(height: 20),
              commonTextfieldCover(1, deptController, labelText: 'Department'),
              SizedBox(height: 20),
              commonTextfieldCover(1, submittedToNameController,
                  labelText: 'Submitted To Name'),
              SizedBox(height: 20),
              commonTextfieldCover(1, designationController,
                  labelText: 'Designation'),
              SizedBox(height: 20),
              TextButton(
                  onPressed: generatePDF, child: Text('Generate and View PDF'))
            ],
          ),
        ),
      ),
    );
  }
}
