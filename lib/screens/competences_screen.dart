import 'package:flutter/material.dart';
import 'package:portfolio_app/models/person.dart';
import 'package:portfolio_app/widgets/styled_app_bar.dart';
import 'package:portfolio_app/widgets/styled_text.dart';

class CompetenceScreen extends StatelessWidget {
  const CompetenceScreen({super.key, required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppbar.getStyledAppbar('Competencias'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: person.listCompetences.length,
            itemBuilder: (context, index) {
              final competence = person.listCompetences[index];
              return Center(
                child: SizedBox(
                  width:
                      constraints.maxWidth > 780 ? 780 : constraints.maxWidth,
                  child: Card(
                    child: ListTile(
                      title: StyledText(
                        text: competence,
                        color: Colors.blueAccent[200]!,
                        fontSize: 22,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
