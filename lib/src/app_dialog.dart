import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final void Function()? left;
  final void Function()? right;
  final Widget body;
  final String yearPage;
  const AppDialog({
    Key? key,
    this.left,
    this.right,
    required this.body,
    required this.yearPage,
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
            body,
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
