import 'package:flutter/material.dart';
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
    final Person person = _getPerson();

    return MaterialApp(
      home: StartScreen(
        facePhoto: Image.asset('images/people/placeholder.png'),
        person: person,
      ),
      theme: ThemeData.dark(useMaterial3: true),
    );
  }

  List<Technology> _getTechnologies() {
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
    return [
      'Siempre en búsqueda de nuevo conocimiento',
      'Adaptabilidad',
      'Trabajo en equipo',
      'Capacidad de análisis',
      'Creatividad',
      'Resolutivo',
    ];
  }

  Person _getPerson() {
    Person person = Person(
      name: "Carlos Santos Expósito",
      photo: 'images/people/placeholder.png',
      listTechnologies: _getTechnologies(),
      listCompetences: _getCompetences(),
    );

    person.email = "carsanexp@gmail.com";
    person.github = "https://github.com/Apagafuegos";
    person.phoneNumber = "+34 644929149";

    return person;
  }
}
