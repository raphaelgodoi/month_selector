import 'package:flutter/material.dart';
import 'package:month_selector/src/app_button.dart';

class AppDialog extends StatelessWidget {
  final void Function()? left;
  final void Function()? right;
  final List<Widget> body;
  final String yearPage;
  final dynamic Function() cancel;
  final dynamic Function() confirm;
  const AppDialog({
    Key? key,
    this.left,
    this.right,
    required this.body,
    required this.yearPage,
    required this.cancel,
    required this.confirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: left, icon: const Icon(Icons.arrow_left)),
                Text(
                  yearPage,
                  style: const TextStyle(fontSize: 20),
                ),
                IconButton(
                    onPressed: right, icon: const Icon(Icons.arrow_right)),
              ],
            ),
            const SizedBox(height: 20),
            ...body,
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppButton(onPressed: cancel, label: "Cancelar"),
                AppButton(onPressed: confirm, label: "Ok")
              ],
            )
          ],
        ),
      ),
    );
  }
}
