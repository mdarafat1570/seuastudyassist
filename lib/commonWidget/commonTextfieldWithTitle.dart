import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget commonTextfieldWithTitle(
  String title,
  bool isRequired,
  int numberOfLine,
  TextEditingController controller, {
  double? width,
  bool isTextFieldEnable = true,
  String? errorMessage,
  double? suggestionMessage = 0,
  void Function(String)? onChanged,
  bool isSuggestionRequired = false,
  TextInputType keyboardInputType = TextInputType.text,
  dynamic hint,
  String? Function(String?)? validator,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 6),
            child: Text(
              title,
              style: GoogleFonts.openSans(
                fontSize: 12,
                letterSpacing: .5,
                color: const Color.fromARGB(255, 78, 100, 144),
              ),
            ),
          ),
          Visibility(
            visible: isRequired,
            child: Container(
              margin: const EdgeInsets.only(left: 1),
              child: Text(
                "*",
                style: GoogleFonts.openSans(
                  fontSize: 12,
                  letterSpacing: .5,
                  color: const Color.fromARGB(255, 240, 5, 5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Visibility(
            visible: isSuggestionRequired,
            child: Container(
              margin: const EdgeInsets.only(left: 1),
              child: Text(
                '[Due: ${suggestionMessage!}]',
                style: GoogleFonts.openSans(
                  fontSize: 10,
                  letterSpacing: .3,
                  color: const Color.fromARGB(255, 78, 100, 144),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 5,
      ),
      SizedBox(
        height: null,
        width: width,
        child: TextFormField(
          // Changed to TextFormField for validation support
          maxLines: numberOfLine,
          controller: controller,
          enabled: isTextFieldEnable,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            isCollapsed: true,
            errorText: errorMessage,
            errorMaxLines: 3,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            fillColor: Colors.grey[200],
            filled: !isTextFieldEnable,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.red,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                width: 1,
                color: Color.fromARGB(255, 213, 213, 213),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                width: 1,
                color: Color.fromARGB(255, 213, 213, 213),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                width: 1,
                color: Color.fromARGB(255, 158, 210, 253),
              ),
            ),
          ),
          keyboardType: keyboardInputType,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
          validator: validator, // Validator function passed here
        ),
      ),
    ],
  );
}
