import 'package:flutter/material.dart';

class DetailsModel {
  String title;
  String description;
  String date;
  String time;
  num amount;
  String typeOfEntry;
  DetailsModel(
      {required this.title,
      required this.description,
      required this.date,
      required this.time,
      required this.amount,
      required this.typeOfEntry});
}
