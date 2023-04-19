import 'package:flutter/material.dart';
import 'package:month_selector/month_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Month Selector',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? month;

  String monthDisplay(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    return "$month/$year";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const MonthSelector();
                });
          },
          child: Text(month != null ? monthDisplay(month!) : "Selecione o mês"),
        ),
      ),
    );
  }
}
