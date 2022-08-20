import 'package:expense_tracker_advanced/models/chart_model.dart';
import 'package:expense_tracker_advanced/models/details_model.dart';
import 'package:expense_tracker_advanced/screens/details_screen.dart';
import 'package:expense_tracker_advanced/widgets/add_button.dart';
import 'package:expense_tracker_advanced/widgets/chart.dart';
import 'package:expense_tracker_advanced/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  num expenses = 0;
  num income = 0;
  num savings = 0;
  bool listIsEmpty = true;

  List<DetailsModel> detailList = [];
  List<DetailsModel> detailListsorted = [];

  List<ChartModel> chartList(expenses, income) {
    var totalSaving = income - expenses;
    List<ChartModel> data = [
      ChartModel('Expenses', expenses, Colors.red),
      ChartModel('Income', income, Colors.green),
      ChartModel('savings', totalSaving, Colors.grey),
    ];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: listIsEmpty
            ? Column(
                children: [
                  AddButton(
                    navigator: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((BuildContext context) => DetailsScreen()),
                        ),
                      ).then((value) {
                        setState(() {
                          if (value[5] == 'Income') {
                            income += value[4];
                          } else {
                            expenses += value[4];
                          }
                          listIsEmpty = false;

                          detailList.add(DetailsModel(
                              title: value[0],
                              description: value[1],
                              date: value[2].toString(),
                              time: value[3].toString(),
                              amount: value[4],
                              typeOfEntry: value[5]));
                          detailListsorted = detailList.reversed.toList();
                        });
                      });
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Text(
                    'No Entry added yet',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Image.asset(
                      'assets/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : Column(
                children: [
                  AddButton(
                    navigator: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((BuildContext context) => DetailsScreen()),
                        ),
                      ).then((value) {
                        setState(() {
                          if (value[5] == 'Income') {
                            income += value[4];
                          } else {
                            expenses += value[4];
                          }
                          listIsEmpty = false;

                          detailList.add(DetailsModel(
                              title: value[0],
                              description: value[1],
                              date: value[2].toString(),
                              time: value[3].toString(),
                              amount: value[4],
                              typeOfEntry: value[5]));
                          detailListsorted = detailList.reversed.toList();
                        });
                      });
                    },
                  ),
                  ChartWidget(chartList: chartList(expenses, income)),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: detailListsorted.length,
                      itemBuilder: ((context, index) => CustomListTile(
                            title: detailListsorted[index].title,
                            desc: detailListsorted[index].description,
                            date: detailListsorted[index].date,
                            time: detailListsorted[index].time,
                            amount: detailListsorted[index].amount.toString(),
                            typeOfEntry: detailListsorted[index].typeOfEntry,
                          ))),
                ],
              ),
      ),
    );
  }
}
