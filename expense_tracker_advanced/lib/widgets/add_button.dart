import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  VoidCallback navigator;
  AddButton({required this.navigator});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: navigator,
        child: Text('+ Add',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 17)),
      ),
    );
  }
}
