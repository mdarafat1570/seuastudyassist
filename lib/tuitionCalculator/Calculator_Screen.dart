import 'package:flutter/material.dart';
import 'package:seustudyassist/commonWidget/custom_Text.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController creditController = TextEditingController();
  TextEditingController pricePerCreditController = TextEditingController();
  TextEditingController libraryFeesController = TextEditingController();

  double totalFees = 0.0;

  @override
  void dispose() {
    creditController.dispose();
    pricePerCreditController.dispose();
    libraryFeesController.dispose();
    super.dispose();
  }

  void calculateTotalFees() {
    double creditHours = double.tryParse(creditController.text) ?? 0.0;
    double pricePerCredit =
        double.tryParse(pricePerCreditController.text) ?? 0.0;
    double libraryFees = double.tryParse(libraryFeesController.text) ?? 0.0;

    setState(() {
      totalFees = (creditHours * pricePerCredit) + libraryFees;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Details Page ",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              children: [
                Text("Credit"),
              ],
            ),
            const SizedBox(height: 10.0),
            commonTextfield(1, creditController, width: 350.0),
            const SizedBox(height: 20.0),
            commonTextfield(1, pricePerCreditController, width: 350.0),
            const SizedBox(height: 20.0),
            commonTextfield(1, libraryFeesController, width: 350.0),
            const SizedBox(height: 20.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const SizedBox(width: 10),
            //     SizedBox(
            //       width: MediaQuery.of(context).size.width * 0.4,
            //       child: TextButton(
            //         style: ButtonStyle(
            //           foregroundColor:
            //               MaterialStateProperty.all<Color>(Colors.white),
            //           backgroundColor: MaterialStateProperty.all<Color>(
            //               AppColor.primaryColor), // Set the background color
            //           side: MaterialStateProperty.all<BorderSide>(
            //               const BorderSide(
            //                   color: AppColor.primaryColor,
            //                   width: 2.0)), // Set the border color and width
            //         ),
            //         onPressed: calculateTotalFees,
            //         child: const Text('Calculate Total Fee'),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200.0,
                      child: Center(
                        child: Text(
                          'Total Fees: ${totalFees.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width * 0.4,
                color: Colors
                    .transparent, // Add a transparent color to make it tappable
                child: const Center(
                  child: Text(
                    'Tap to see total fees',
                    style: TextStyle(
                      color: Colors.blue, // Change color as per your design
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
