import 'package:flutter/material.dart';
import 'package:month_selector/src/app_card.dart';
import 'package:month_selector/src/app_dialog.dart';
import 'package:month_selector/src/month_enum.dart';

class MonthSelector extends StatefulWidget {
  final DateTime? firstDate;
  final DateTime? lastDate;
  final List<String>? months;
  const MonthSelector({
    this.firstDate,
    this.lastDate,
    this.months,
    Key? key,
  }) : super(key: key);

  @override
  State<MonthSelector> createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  late final DateTime _firstDate;
  late final DateTime _lastDate;
  late final DateTime _initialDate;
  late int _yearPage;

  @override
  void initState() {
    _initialDate = formatterDate(DateTime.now());
    _firstDate = widget.firstDate != null
        ? formatterDate(widget.firstDate!)
        : DateTime(_initialDate.year - 2);
    _lastDate = widget.lastDate != null
        ? formatterDate(widget.lastDate!)
        : DateTime(_initialDate.year + 3, 12);
    _yearPage = _initialDate.year;
    super.initState();
  }

  DateTime formatterDate(DateTime date) {
    return DateTime(date.year, date.month);
  }

  void left() {
    if (_yearPage > _firstDate.year) {
      setState(() {
        _yearPage -= 1;
      });
    }
  }

  void right() {
    if (_yearPage < _lastDate.year) {
      setState(() {
        _yearPage += 1;
      });
    }
  }

  bool isValid(DateTime date) {
    return date.compareTo(_lastDate) <= 0 && date.compareTo(_firstDate) >= 0;
  }

  @override
  Widget build(BuildContext context) {
    const width = 50.0;
    final elements = MonthEnum.values.map((e) {
      final date = DateTime(_yearPage, e.index + 1);
      return AppCard(
        width: width,
        color: Colors.transparent,
        borderColor:
            date == _initialDate ? Theme.of(context).primaryColor : null,
        onTap: () {},
        child: Text(
          widget.months?[e.index] ?? e.name,
          style: TextStyle(
            fontSize: 15,
            color: isValid(date) ? Colors.black : Colors.black26,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }).toList();
    return AppDialog(
      yearPage: _yearPage.toString(),
      left: left,
      right: right,
      body: wrapElements(
          elements: elements,
          widthElement: width,
          widthScreen: MediaQuery.of(context).size.width * 0.65),
      confirm: () {},
      cancel: () {},
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
