import 'package:flutter/material.dart';
import 'package:seustudyassist/base/AppColour.dart';
import 'package:seustudyassist/commonWidget/custom_Text.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen>
    with TickerProviderStateMixin {
  TextEditingController creditController = TextEditingController();
  TextEditingController pricePerCreditController = TextEditingController();
  TextEditingController libraryFeesController = TextEditingController();

  double totalFees = 0.0;

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -0.2),
      end: const Offset(0.0, 0.2),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    creditController.dispose();
    pricePerCreditController.dispose();
    libraryFeesController.dispose();
    super.dispose();
  }

  void calculateTotalFees() {
    String creditInput = creditController.text;
    String pricePerCreditInput = pricePerCreditController.text;
    String libraryFeesInput = libraryFeesController.text;

    // Check if any of the input fields are empty
    if (creditInput.isEmpty ||
        pricePerCreditInput.isEmpty ||
        libraryFeesInput.isEmpty) {
      // Show alert if any of the input fields are empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Missing Input'),
            content: Text('Please enter values for all input fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // If all input fields are filled, calculate total fees
    double creditHours = double.tryParse(creditInput) ?? 0.0;
    double pricePerCredit = double.tryParse(pricePerCreditInput) ?? 0.0;
    double libraryFees = double.tryParse(libraryFeesInput) ?? 0.0;

    setState(() {
      totalFees = (creditHours * pricePerCredit) + libraryFees;
    });

    // Show total fees in a modal bottom sheet
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Text(
                  'Total Fees: ${totalFees.toStringAsFixed(2)} Tk',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Tuition Fee Calculator",
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
                Text(" Subject Credits"),
              ],
            ),
            const SizedBox(height: 10.0),
            commonTextfield(1, creditController, width: 350.0),
            const SizedBox(height: 20.0),
            const Row(
              children: [
                Text(" Tuition Per Credit (Tk)"),
              ],
            ),
            const SizedBox(height: 10.0),
            commonTextfield(1, pricePerCreditController, width: 350.0),
            const SizedBox(height: 20.0),
            const Row(
              children: [
                Text(" Laboratory Fee"),
              ],
            ),
            const SizedBox(height: 10.0),
            commonTextfield(1, libraryFeesController, width: 350.0),
            const SizedBox(height: 40.0),
            TextButton(
              onPressed: () {
                calculateTotalFees();
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                padding: EdgeInsets.zero,
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.4,
                  50.0,
                ),
              ),
              child: const Center(
                child: Text(
                  'Tap to see total fees',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
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
