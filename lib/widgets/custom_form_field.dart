// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({super.key, required this.textInput, required this.text});
  TextInputType textInput;
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 15,
      ),
      Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: TextField(
          keyboardType: textInput,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
