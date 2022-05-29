import 'package:flutter/material.dart';
import 'package:new_project1/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final onChanged;
  final controller;
  final hintText;
  final labelText;
  final suffixIcon;
  final prefixIcon;
  final obscureText;

  CustomTextField({
    required this.onChanged,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          filled: true,
          fillColor: textFieldBackground,
          hintText: hintText,
          labelText: labelText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon),
    );
  }
}
