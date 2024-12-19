import 'package:flutter/material.dart';

class LinesBar extends StatelessWidget {
  const LinesBar({super.key, required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.blueAccent[200]!,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
