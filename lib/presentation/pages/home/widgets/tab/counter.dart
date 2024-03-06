import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({
    super.key,
    required this.number,
    required this.textColor,
    required this.dotColor,
  });

  final int number;
  final Color textColor;
  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    return number != 0
        ? SizedBox(
            height: 20,
            width: 20,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$number',
                  style: TextStyle(
                    fontSize: 12,
                    color: textColor,
                  ),
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
