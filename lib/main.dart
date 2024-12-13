import 'package:flutter/material.dart';
import 'package:portfolio_app/models/app_config.dart';
import 'package:portfolio_app/models/person.dart';
import 'package:portfolio_app/models/technology.dart';
import 'package:portfolio_app/screens/start_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final Future<Person> person = _getPerson();

    return MaterialApp(
      home: FutureBuilder(
        future: person,
        builder: (context, snapshot) {
          final person = snapshot.data;
          if (snapshot.hasData) {
            return StartScreen(
              facePhoto: Image.asset(person!.photo),
              person: person,
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
      theme: ThemeData.dark(useMaterial3: true),
    );
  }

  List<Technology> _getTechnologies() {
    //Here you could change your technologies easily
    return [
      Technology(
        name: 'Flutter',
        description:
            "Framework de desarrollo de aplicaciones multiplataforma para Dart",
      ),
      Technology(
        name: 'Java',
        description: "Lenguaje de programación",
      ),
      Technology(
        name: 'Spring Data JPA',
        description:
            "Framework para el acceso y manejo de bases de datos usando JPA",
      ),
      Technology(
        name: 'Ionic',
        description:
            "Framework para el desarrollo de aplicaciones multiplataforma para TypeScript",
      ),
      Technology(
        name: 'SQL',
        description: "Lenguaje de consulta estructurada para bases de datos",
      ),
      Technology(
        name: 'Rust',
        description: 'Lenguaje de programación',
      ),
      Technology(
        name: 'HTML/CSS',
        description: 'Lenguajes de marcado y estilos para la web',
      ),
    ];
  }

  List<String> _getCompetences() {
    //Same as with technologies
    return [
      'Siempre en búsqueda de nuevo conocimiento',
      'Adaptabilidad',
      'Trabajo en equipo',
      'Capacidad de análisis',
      'Creatividad',
      'Resolutivo',
    ];
  }

  Future<Person> _getPerson() async {
    //Same as with your personal data
    AppConfig appConfig = await AppConfig.loadConfig();

    Person person = Person(
      name: appConfig.fullName,
      photo: 'assets/people/placeholder.png',
      listTechnologies: _getTechnologies(),
      listCompetences: _getCompetences(),
    );

    person.email = appConfig.email;
    person.github = appConfig.gitHubLink;
    person.phoneNumber = appConfig.phoneNumber;
    person.githubApi = appConfig.gitHubApiLink;
    return person;
  }
}
