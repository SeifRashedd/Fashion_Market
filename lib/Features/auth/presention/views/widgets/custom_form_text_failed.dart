import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.onChange,
    this.obscureText = false,
    this.controller,
  });

  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final Function(String)? onChange;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      onChanged: onChange,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        contentPadding: const EdgeInsets.all(20),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
