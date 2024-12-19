import 'package:flutter/material.dart';
import 'package:portfolio_app/models/project.dart';
import 'package:portfolio_app/widgets/lines_chart.dart';
import 'package:portfolio_app/widgets/styled_app_bar.dart';
import 'package:portfolio_app/widgets/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.project});

  final Project project;

  void followLink() async {
    await launchUrl(Uri.parse(project.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppbar.getStyledAppbar(project.name),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 780) {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 780,
                          child: Column(
                            children: [
                              StyledText(
                                text: project.longDescription!,
                                color: Colors.white70,
                                fontSize: 25,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 10),
                              LinesChart(
                                linesOfCode: project.linesOfCode,
                                fontSize: 12,
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () => followLink(),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: StyledText(
                                    text: 'Ver el proyecto en GitHub',
                                    color: Colors.blueAccent[200]!,
                                    fontSize: 20,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: SizedBox(
                      width: constraints.maxWidth * 0.9,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              StyledText(
                                text: project.longDescription!,
                                color: Colors.white70,
                                fontSize: 18,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 20),
                              LinesChart(
                                linesOfCode: project.linesOfCode,
                                fontSize: 8,
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () => followLink(),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: StyledText(
                                    text: 'Ver el proyecto en GitHub',
                                    color: Colors.blueAccent[200]!,
                                    fontSize: 20,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
