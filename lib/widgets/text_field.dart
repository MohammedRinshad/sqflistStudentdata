// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget(
      {super.key,
      required this.controller,
      required this.labelText,
      this.obscureText = false,
      this.suffixIcon});
  TextEditingController controller = TextEditingController();
  String labelText;
  bool obscureText;

  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.95,
      child: TextFormField(
        cursorColor: Colors.black,
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black87,
              ),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black87,
              ),
              borderRadius: BorderRadius.circular(10)),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black87,
              ),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black87,
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
