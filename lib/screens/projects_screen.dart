import 'package:flutter/material.dart';
import 'package:portfolio_app/models/person.dart';
import 'package:portfolio_app/models/project.dart';
import 'package:portfolio_app/screens/project_detail_screen.dart';
import 'package:portfolio_app/widgets/styled_app_bar.dart';
import 'package:portfolio_app/widgets/styled_text.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key, required this.person});
  final Person person;

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
      Aplicación con interfaz de usuario realizada en Swing para la gestión de contraseñas de distintas plataformas de un usuario. Usa el plugin de conexión a base de datos MySQL para almacenar las contraseñas.
      """,
      """
      Aplicación móvil multiplataforma que reúne todos los datos profesionales necesarios para presentar un perfil profesional. Incluye información sobre tecnologías, aptitudes, proyectos y contacto. Incluye el uso de la API de GitHub para mostrar los proyectos del usuario.
      """,
      """
      Proyecto final del primer curso del Grado de Desarrollo de Aplicaciones Multiplataforma. Usando el plugin de conexión a base de datos Oracle, se desarrolla una aplicación de gestión de una liga de equipos y jugadores de fútbol.
      """,
    ];

    Future<List<Project>> projects =
        Project.fetchProjects(widget.person.githubApi!);

    return Scaffold(
      appBar: StyledAppbar.getStyledAppbar("Mis proyectos"),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: FutureBuilder<List<Project>>(
          future: projects,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const StyledText(
                text: 'Error al cargar los proyectos',
                color: Colors.redAccent,
                fontSize: 15,
                textAlign: TextAlign.center,
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const StyledText(
                text: 'No hay proyectos disponibles',
                color: Colors.white70,
                fontSize: 15,
                textAlign: TextAlign.center,
              );
            }

            final projectsData = snapshot.data!;
            return LayoutBuilder(
              builder: (context, constraints) {
                return ListView.builder(
                  itemCount: projectsData.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const SizedBox(height: 0);
                    }
                    final project = projectsData[index];
                    project.longDescription =
                        projectDescription[index % projectDescription.length];
                    return Center(
                      child: SizedBox(
                        width:
                            constraints.maxWidth > 780 ? 780 : double.infinity,
                        child: Card(
                          child: ListTile(
                            title: StyledText(
                              text: project.name,
                              color: Colors.blueAccent[200]!,
                              fontSize: 20,
                              textAlign: constraints.maxWidth > 780
                                  ? TextAlign.center
                                  : TextAlign.start,
                            ),
                            subtitle: Column(
                              crossAxisAlignment: constraints.maxWidth > 780
                                  ? CrossAxisAlignment.center
                                  : CrossAxisAlignment.start,
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
                                  textAlign: constraints.maxWidth > 780
                                      ? TextAlign.center
                                      : TextAlign.start,
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
              },
            );
          },
        ),
      ),
    );
  }
}
