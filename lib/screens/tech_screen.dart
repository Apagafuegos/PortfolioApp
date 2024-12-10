import 'package:flutter/material.dart';
import 'package:portfolio_app/models/technology.dart';
import 'package:portfolio_app/widgets/styled_text.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({super.key, required this.listTechnologies});

  final List<Technology> listTechnologies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledText(
          color: Colors.white60,
          fontSize: 20,
          text: "Mis tecnologías",
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: listTechnologies.length,
        itemBuilder: (context, index) {
          final tech = listTechnologies[index];
          return Card(
            child: ListTile(
              title: StyledText(
                text: tech.name,
                color: Colors.purple,
                fontSize: 20,
                textAlign: TextAlign.start,
              ),
              subtitle: StyledText(
                text: tech.description,
                color: Colors.white70,
                fontSize: 10,
                textAlign: TextAlign.start,
              ),
            ),
          );
        },
      ),
    );
  }
}
