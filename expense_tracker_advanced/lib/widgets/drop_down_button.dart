import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropDownWidget extends StatefulWidget {
  Function selectFunc;
  String? selectedValue;
  DropDownWidget({required this.selectedValue, required this.selectFunc});
  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  var items = ['Expenses', 'Income'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 8),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: const [
              Expanded(
                child: Text(
                  'Expenses',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: widget.selectedValue,
          onChanged: (value) {
            widget.selectFunc(value);
          },
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 25,
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.grey,
          buttonHeight: 60,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          buttonElevation: 0,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: MediaQuery.of(context).size.width - 40,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
        ),
      ),
    );
  }
}
