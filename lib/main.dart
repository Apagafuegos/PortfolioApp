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
      title: 'Carlos Santos',
      home: FutureBuilder(
        future: person,
        builder: (context, snapshot) {
          final person = snapshot.data;
          if (snapshot.hasData) {
            return StartScreen(
              facePhoto: Image.asset('assets/people/Logo-1000.png'),
              person: person!,
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
        level: 3,
        link: '',
      ),
      Technology(
        name: 'HTML/CSS',
        level: 2,
        link: '',
      ),
      Technology(
        name: 'Ionic-Angular',
        level: 2,
        link: '',
      ),
      Technology(
        name: 'Java',
        level: 2,
        link: '',
      ),
      Technology(
        name: 'Rust',
        level: 2,
        link: '',
      ),
      Technology(
        name: 'SQL',
        level: 2,
        link: '',
      ),
      Technology(
        name: 'Spring Data JPA',
        level: 2,
        link: '',
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
      photo: 'assets/people/personalPhoto2.jpg',
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
