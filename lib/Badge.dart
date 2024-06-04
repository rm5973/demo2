import 'package:flutter/material.dart';

class Badge1 extends StatelessWidget {
  final Widget child;
  final String value;
  final Color? color;

  Badge1({
    required this.child,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: color ?? Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
