import 'package:flutter/material.dart';
import 'package:portfolio_app/models/project.dart';
import 'package:portfolio_app/screens/project_detail_screen.dart';
import 'package:portfolio_app/widgets/styled_app_bar.dart';
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
    List<String> projectDescription = [
      """
      Aplicación con interfaz de usuario realizada en Swing para la gestión de contraseñas de distintas plataformas de un usuario.
      \nUsa el plugin de conexión a base de datos MySQL para almacenar las contraseñas.
      """,
      """
      Aplicación móvil multiplataforma que reúne todos los datos profesionales necesarios para presentar un perfil profesional.
      \nIncluye información sobre tecnologías, aptitudes, proyectos y contacto.
      \nIncluye el uso de la API de GitHub para mostrar los proyectos del usuario.
      """,
      """
      Proyecto final del primer curso del Grado de Desarrollo de Aplicaciones Multiplataforma.
      \nUsando el plugin de conexión a base de datos Oracle, se desarrolla una aplicación de gestión de una liga de equipos y jugadores de fútbol.
      """,
    ];

    Future<List<Project>> projects = Project.fetchProjects();

    return Scaffold(
      appBar: StyledAppbar.getStyledAppbar("Mis proyectos"),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 780) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: FutureBuilder<List<Project>>(
                future: projects,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return const SizedBox(height: 0);
                        }
                        final project = snapshot.data![index];
                        project.longDescription = projectDescription[index - 1];
                        return Center(
                          child: SizedBox(
                            width: constraints.maxWidth * 0.8,
                            child: Card(
                              child: ListTile(
                                title: StyledText(
                                  text: project.name,
                                  color: Colors.purple,
                                  fontSize: 20,
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                onTap: () => _projectDetail(context, project),
                                minVerticalPadding: 30,
                              ),
                            ),
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
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: FutureBuilder<List<Project>>(
                future: projects,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return const SizedBox(height: 0);
                        }
                        final project = snapshot.data![index];
                        project.longDescription = projectDescription[index - 1];
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
            );
          }
        },
      ),
    );
  }
}
