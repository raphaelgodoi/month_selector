library month_selector;

import 'package:flutter/material.dart';
import 'package:month_selector/src/app_card.dart';
import 'package:month_selector/src/app_dialog.dart';

class MonthSelector extends StatefulWidget {
  const MonthSelector({
    Key? key,
  }) : super(key: key);

  @override
  State<MonthSelector> createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  @override
  Widget build(BuildContext context) {
    const width = 50.0;
    final elements = _MonthSelectorEnum.values.map((e) {
      return AppCard(
        width: width,
        color: Colors.transparent,
        onTap: () {},
        child: Text(
          e.name,
          style: const TextStyle(
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }).toList();
    return AppDialog(
      confirm: () {},
      cancel: () {},
      yearPage: "2020",
      body: wrapElements(
          elements: elements,
          widthElement: width,
          widthScreen: MediaQuery.of(context).size.width * 0.65),
    );
  }

  List<Widget> wrapElements(
      {required double widthScreen,
      required double widthElement,
      required List<Widget> elements}) {
    final numRows = ((widthElement * elements.length) / (widthScreen)).ceil();
    final numCols = elements.length ~/ numRows;
    final List<Widget> rows = [];
    for (int i = 0; i < numRows; i++) {
      final start = i * numCols;
      final end = (i + 1) * numCols;
      final rowChildren = elements.sublist(start, end);
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: rowChildren,
      ));
    }
    return rows;
  }
}

enum _MonthSelectorEnum {
  jan,
  feb,
  mar,
  apr,
  may,
  jun,
  jul,
  aug,
  sep,
  oct,
  nov,
  dec
}
