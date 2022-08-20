import 'package:flutter/material.dart';

class CustomIconBox extends StatelessWidget {
  VoidCallback picker;
  IconData icon;
  CustomIconBox({required this.picker, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 8),
        height: 68.5,
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
              padding: EdgeInsets.all(8),
              child: InkWell(
                onTap: picker,
                child: Icon(
                  icon,
                  size: 35,
                ),
              )),
        ),
      ),
    );
  }
}
