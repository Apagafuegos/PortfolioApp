import 'package:flutter/material.dart';
import 'package:portfolio_app/models/person.dart';
import 'package:portfolio_app/widgets/styled_text.dart';

class CompetenceScreen extends StatelessWidget {
  const CompetenceScreen({super.key, required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledText(
          text: "Mis competencias",
          color: Colors.white60,
          fontSize: 20,
          textAlign: TextAlign.center,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 780) {
            return ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: person.listCompetences.length,
              itemBuilder: (context, index) {
                final competence = person.listCompetences[index];
                return Center(
                  child: SizedBox(
                    width: constraints.maxWidth * 0.6,
                    child: Card(
                      child: ListTile(
                        title: StyledText(
                          text: competence,
                          color: Colors.purple[600]!,
                          fontSize: 22,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: person.listCompetences.length,
              itemBuilder: (context, index) {
                final competence = person.listCompetences[index];
                return Card(
                  child: ListTile(
                    title: StyledText(
                      text: competence,
                      color: Colors.purple[600]!,
                      fontSize: 22,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
