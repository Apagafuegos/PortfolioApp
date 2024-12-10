import 'package:flutter/material.dart';
import 'package:portfolio_app/models/project.dart';
import 'package:portfolio_app/screens/project_detail_screen.dart';
import 'package:portfolio_app/widgets/styled_text.dart';

// ignore: must_be_immutable
class ProjectsScreen extends StatefulWidget {
  ProjectsScreen({super.key});

  List<Project>? listProjects;

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  void _projectDetail(BuildContext context, Project project) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectDetailScreen(project: project),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Project>> projects = Project.fetchProject();

    return Scaffold(
        appBar: AppBar(
          title: const StyledText(
            text: "Mis proyectos",
            color: Colors.white60,
            fontSize: 20,
            textAlign: TextAlign.start,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: FutureBuilder<List<Project>>(
            future: projects,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final project = snapshot.data![index];
                    return Card(
                      child: ListTile(
                        title: StyledText(
                          text: project.name,
                          color: Colors.purple,
                          fontSize: 20,
                          textAlign: TextAlign.start,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            StyledText(
                              text: project.description,
                              color: Colors.white70,
                              fontSize: 15,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 10),
                            StyledText(
                              text: project.language,
                              color: Colors.white60,
                              fontSize: 15,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        onTap: () => _projectDetail(context, project),
                        minVerticalPadding: 30,
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return const StyledText(
                  text: 'Error al cargar los proyectos',
                  color: Colors.redAccent,
                  fontSize: 15,
                  textAlign: TextAlign.center,
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }
}
