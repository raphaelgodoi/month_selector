import 'package:flutter/material.dart';
import 'package:month_selector/src/app_card.dart';
import 'package:month_selector/src/app_dialog.dart';
import 'package:month_selector/src/month_enum.dart';

class MonthSelector extends StatefulWidget {
  final void Function(List<DateTime>?) callback;
  final List<DateTime> selectedDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool multiSelection;
  final List<String>? months;
  final double height;
  final double width;
  final Color? selectedColor;
  final Color? selectedTextColor;
  final double? fontSizeMonth;
  final Color? colorConfirm;
  final Color? colorCancel;
  final String labelConfirm;
  final String labelCancel;
  final TextStyle? textStyleYear;

  const MonthSelector({
    Key? key,
    required this.callback,
    this.selectedDate = const [],
    this.firstDate,
    this.lastDate,
    this.multiSelection = true,
    this.months,
    this.height = 50,
    this.width = 50,
    this.selectedColor,
    this.fontSizeMonth,
    this.selectedTextColor,
    this.colorConfirm,
    this.colorCancel,
    this.labelConfirm = "Ok",
    this.labelCancel = "Cancel",
    this.textStyleYear,
  }) : super(key: key);

  @override
  State<MonthSelector> createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  late final DateTime _firstDate;
  late final DateTime _lastDate;
  late final bool _multiSelection;
  late final DateTime _initialDate;
  late List<DateTime> _selectedDate;
  late int _yearPage;

  @override
  void initState() {
    _multiSelection = widget.multiSelection;
    _initialDate = formatterDate(DateTime.now());
    _firstDate = widget.firstDate != null
        ? formatterDate(widget.firstDate!)
        : DateTime(_initialDate.year - 2);
    _lastDate = widget.lastDate != null
        ? formatterDate(widget.lastDate!)
        : DateTime(_initialDate.year + 5, 12);
    _selectedDate = widget.selectedDate.isEmpty
        ? [_initialDate]
        : widget.selectedDate.map((e) => formatterDate(e)).toList();
    _yearPage = _selectedDate[0].year;
    super.initState();
  }

  DateTime formatterDate(DateTime date) {
    return DateTime(date.year, date.month);
  }

  bool isSelected(DateTime date) => _selectedDate.contains(date);

  void selectDate(DateTime newDate) {
    if (isValid(newDate)) {
      setState(() {
        if (_multiSelection) {
          isSelected(newDate)
              ? _selectedDate.remove(newDate)
              : _selectedDate.add(newDate);
        } else {
          _selectedDate = [newDate];
        }
      });
    }
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
    final elements = MonthEnum.values.map((e) {
      final date = DateTime(_yearPage, e.index + 1);
      return AppCard(
        color: isSelected(date) ? widget.selectedColor : Colors.transparent,
        borderColor:
            date == _initialDate ? Theme.of(context).primaryColor : null,
        width: widget.width,
        height: widget.height,
        onTap: () => selectDate(date),
        child: Text(
          widget.months?[e.index] ?? e.name,
          style: TextStyle(
            fontSize: widget.fontSizeMonth ?? 15,
            color: textColor(
              date: date,
              selectedTextColor: widget.selectedTextColor,
            ),
          ),
          textAlign: TextAlign.center,
        ),
      );
    }).toList();
    return AppDialog(
      yearPage: _yearPage.toString(),
      textStyleYear: widget.textStyleYear,
      left: left,
      right: right,
      cancel: () => widget.callback(null),
      confirm: () => widget.callback(_selectedDate),
      labelConfirm: widget.labelConfirm,
      labelCancel: widget.labelCancel,
      colorConfirm: widget.colorConfirm,
      colorCancel: widget.colorCancel,
      body: wrapElements(
          elements: elements,
          widthElement: widget.height,
          widthScreen: MediaQuery.of(context).size.width * 0.65),
    );
  }

  Color textColor({required DateTime date, Color? selectedTextColor}) {
    if (isValid(date)) {
      return isSelected(date)
          ? selectedTextColor ?? Colors.white
          : Colors.black;
    }
    return Colors.black26;
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
