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
      yearPage: "2020",
      body: Wrap(
        children: [...elements],
      ),
    );
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
