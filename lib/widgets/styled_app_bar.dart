import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/styled_text.dart';

class StyledAppbar {
  static AppBar getStyledAppbar(String text) {
    return AppBar(
      title: StyledText(
        color: Colors.white60,
        fontSize: 20,
        text: text,
        textAlign: TextAlign.start,
      ),
    );
  }
}
