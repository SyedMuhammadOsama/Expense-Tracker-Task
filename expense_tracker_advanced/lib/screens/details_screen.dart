import 'package:expense_tracker_advanced/widgets/drop_down_button.dart';
import 'package:expense_tracker_advanced/widgets/icon_box.dart';
import 'package:expense_tracker_advanced/widgets/text_form_field_read.dart';
import 'package:expense_tracker_advanced/widgets/text_form_field_write.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/custom_keyboard.dart';

class DetailsScreen extends StatefulWidget {
  @override
  DetailScreenState createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailsScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  String? selectedValue = 'Expenses';

  selectDatePicker(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now());
    if (selected != null && selected != dateController.text)
      setState(() {
        dateController.text = DateFormat('dd MMM, 2022').format(selected);
      });
  }

  selectTimePicker(BuildContext context) async {
    final TimeOfDay? selected =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (selected != null && selected != timeController.text)
      setState(() {
        timeController.text =
            MaterialLocalizations.of(context).formatTimeOfDay(selected);
      });
  }

  void insertProcedure(String myText) {
    final text = amountController.text;
    final textSelection = amountController.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    amountController.text = newText;
    amountController.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void backspaceProcedure() {
    final text = amountController.text;
    final textSelection = amountController.selection;
    final selectionLength = textSelection.end - textSelection.start;

    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      amountController.text = newText;
      amountController.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }

    if (textSelection.start == 0) {
      return;
    }

    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    amountController.text = newText;
    amountController.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 200, 194, 194),
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 0),
                    child: TextFormFieldWrite(
                      validator: (textValue) {
                        if (textValue!.isEmpty) {
                          return 'Please enter valid informaton';
                        }
                        return null;
                      },
                      controller: titleController,
                      hintText: 'Title',
                      length: 30,
                      lines: 1,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 5, bottom: 0),
                    child: TextFormFieldWrite(
                      controller: descController,
                      validator: (textValue) {
                        if (textValue!.isEmpty) {
                          return 'Please enter valid informaton';
                        }
                        return null;
                      },
                      hintText: 'Description',
                      length: 100,
                      lines: 4,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 5, bottom: 8),
                    child: Row(
                      children: [
                        CustomIconBox(
                            picker: () {
                              selectDatePicker(context);
                            },
                            icon: Icons.date_range),
                        Expanded(
                          flex: 4,
                          child: TextFormFieldRead(
                              validator: (textValue) {
                                if (textValue!.isEmpty) {
                                  return 'Please enter valid informaton';
                                }
                                return null;
                              },
                              controller: dateController,
                              hintText: 'Date'),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 5, bottom: 8),
                    child: Row(
                      children: [
                        CustomIconBox(
                            picker: () {
                              selectTimePicker(context);
                            },
                            icon: Icons.access_time),
                        Expanded(
                          flex: 4,
                          child: TextFormFieldRead(
                              validator: (textValue) {
                                if (textValue!.isEmpty) {
                                  return 'Please enter valid informaton';
                                }
                                return null;
                              },
                              controller: timeController,
                              hintText: 'Time'),
                        )
                      ],
                    ),
                  ),
                  DropDownWidget(
                      selectedValue: selectedValue,
                      selectFunc: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      }),
                  Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 10),
                      child: TextFormFieldRead(
                        validator: (textValue) {
                          if (textValue!.isEmpty) {
                            return 'Please enter valid informaton';
                          }
                          return null;
                        },
                        controller: amountController,
                        hintText: 'Amount',
                      )),
                  CustomKeyboard(
                    onTextInput: (myText) {
                      insertProcedure(myText);
                    },
                    onBackspace: () {
                      backspaceProcedure();
                    },
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (Form.of(context)?.validate() ?? false) {
                  Navigator.pop(context, [
                    titleController.text,
                    descController.text,
                    dateController.text,
                    timeController.text,
                    num.parse(amountController.text),
                    selectedValue,
                  ]);
                }
              },
              child: const Icon(Icons.check),
            ),
          );
        },
      ),
    );
  }
}
