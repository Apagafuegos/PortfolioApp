import 'package:flutter/material.dart';
import 'package:portfolio_app/models/project.dart';
import 'package:portfolio_app/widgets/styled_app_bar.dart';
import 'package:portfolio_app/widgets/styled_text.dart';
import 'package:url_launcher/link.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppbar.getStyledAppbar(project.name),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  project.image,
                  fit: BoxFit.cover,
                  height: 200,
                  width: 200,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: StyledText(
              text: project.longDescription!,
              color: Colors.white70,
              fontSize: 15,
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 10),
          Link(
            target: LinkTarget.self,
            uri: Uri.parse(project.url),
            builder: (context, followLink) {
              return ElevatedButton(
                onPressed: followLink,
                child: const StyledText(
                  text: "Ver el proyecto en GitHub",
                  color: Colors.deepPurpleAccent,
                  fontSize: 15,
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
