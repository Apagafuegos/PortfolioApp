import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/styled_text.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    super.key,
    required this.text,
    required this.colors,
    required this.height,
    required this.onTap,
    required this.width,
  });

  final String text;
  final List<Color> colors;
  final double width;
  final double height;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: StyledText(
              text: text,
              color: Colors.white.withOpacity(0.8),
              fontSize: 30,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
