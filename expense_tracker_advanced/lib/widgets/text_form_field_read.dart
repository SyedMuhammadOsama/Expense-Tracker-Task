import 'package:flutter/material.dart';

class TextFormFieldRead extends StatelessWidget {
  TextEditingController controller;
  String? Function(String?)? validator;
  String hintText;
  TextFormFieldRead(
      {required this.controller,
      required this.hintText,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: TextInputType.none,
        decoration: InputDecoration(
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(20),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 18),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
        ),
        style: TextStyle(fontSize: 18),
        showCursor: true,
        readOnly: true);
  }
}
