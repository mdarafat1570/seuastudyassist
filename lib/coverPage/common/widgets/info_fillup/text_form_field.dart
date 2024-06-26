import 'package:flutter/material.dart';

class CTextFormField extends StatelessWidget {
  const CTextFormField({
    Key? key,
    required this.label,
    required this.prefixIcon,
    this.maxLength,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.suffixIcon,
    this.onTap,
    this.readOnly = false,
    this.keyBoardType = TextInputType.text,
  }) : super(key: key);

  final String label;
  final int? maxLength;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextInputType keyBoardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        onTap: onTap,
        maxLength: maxLength,
        controller: controller,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(prefixIcon),
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(width: 1, color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(width: 1, color: Colors.lightBlue),
          ),
        ),
        readOnly: readOnly,
        keyboardType: keyBoardType,
      ),
    );
  }
}
