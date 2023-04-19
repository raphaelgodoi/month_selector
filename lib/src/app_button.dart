import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Color? colorLabel;
  final Function() onPressed;

  const AppButton({
    Key? key,
    this.label = "",
    required this.onPressed,
    this.colorLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)))),
      child: Text(
        label,
        style: TextStyle(color: colorLabel),
      ),
    );
  }
}
