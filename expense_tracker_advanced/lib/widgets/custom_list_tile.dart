import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomListTile extends StatelessWidget {
  String title;
  String desc;
  String date;
  String time;
  String amount;
  String typeOfEntry;
  CustomListTile(
      {required this.title,
      required this.desc,
      required this.date,
      required this.time,
      required this.amount,
      required this.typeOfEntry});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.16,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                typeOfEntry == 'Income'
                    ? CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromARGB(255, 245, 240, 240),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 30,
                        ))
                    : CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromARGB(255, 245, 240, 240),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.red,
                          size: 30,
                        )),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3.5),
                            child: Text(
                              title,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 17.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3.5),
                            child: Text(
                              desc,
                              style: TextStyle(
                                fontSize: 15.5,
                                color: Colors.grey,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Text(
                            '$date $time',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 182, 179, 179),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  amount.toString(),
                  style: TextStyle(
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.right,
                )
              ],
            ),
          )),
    );
  }
}
