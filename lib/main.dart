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
    final List<Technology> listTechnologies = [
      Technology(
        name: 'Flutter2',
        description:
            "Framework de desarrollo de aplicaciones móviles para Dart",
        image: 'images/people/placeholder.png',
      ),
      Technology(
        name: 'Java',
        description: "Lenguaje de programación",
        image: 'images/people/java_logo.png',
      ),
      Technology(
        name: 'Spring Boot',
        description: "Framework de desarrollo de aplicaciones web en Java",
        image: 'images/people/placeholder.png',
      ),
    ];

    final Person person = Person(
      name: "Carlos Santos Expósito",
      photo: 'images/people/placeholder.png',
      listTechnologies: listTechnologies,
    );

    person.email = "carsanexp@gmail.com";
    person.github = "https://github.com/Apagafuegos";

    return MaterialApp(
      home: StartScreen(
        facePhoto: Image.asset('images/people/placeholder.png'),
        person: person,
      ),
      theme: ThemeData.dark(useMaterial3: true),
    );
  }
}
