import 'package:flutter/material.dart';

class TextFormFieldWrite extends StatelessWidget {
  TextEditingController controller;
  String? Function(String?)? validator;
  String hintText;
  int length;
  int lines;
  TextFormFieldWrite(
      {required this.controller,
      required this.hintText,
      required this.length,
      required this.lines,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLength: length,
      maxLines: lines,
      decoration: InputDecoration(
        counter: Offstage(),
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
    );
  }
}
