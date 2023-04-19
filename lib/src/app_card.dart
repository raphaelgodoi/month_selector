import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Color? color;
  final void Function()? onTap;
  final Color? borderColor;

  const AppCard({
    Key? key,
    required this.child,
    this.width = 50,
    this.height = 50,
    this.color,
    this.onTap,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: borderColor != null ? Border.all(color: borderColor!) : null,
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: color ?? Theme.of(context).primaryColor,
        ),
        child: child,
      ),
    );
  }
}
