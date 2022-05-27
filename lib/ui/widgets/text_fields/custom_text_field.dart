import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final onChanged;
  final controller;
  final hintText;
  final labelText;
  final suffixIcon;
  final prefixIcon;

  CustomTextField({
    required this.onChanged,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          labelText: labelText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon),
    );
  }
}
