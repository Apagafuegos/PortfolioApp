import 'package:flutter/material.dart';
import 'package:portfolio_app/models/person.dart';
import 'package:portfolio_app/widgets/styled_text.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key, required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledText(
          text: "Contacte conmigo",
          color: Colors.white60,
          fontSize: 20,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
