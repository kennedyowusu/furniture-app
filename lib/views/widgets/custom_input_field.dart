import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    this.controller,
    required this.labelText,
    required this.hintText,
    this.validator,
  });

  final TextEditingController? controller;
  final String labelText, hintText;
  final String Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return validator!(value);
        }
        return null;
      },
    );
  }
}
