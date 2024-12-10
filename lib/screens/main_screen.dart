import 'package:flutter/material.dart';
import 'package:portfolio_app/models/person.dart';
import 'package:portfolio_app/screens/apt_screen.dart';
import 'package:portfolio_app/screens/contact_screen.dart';
import 'package:portfolio_app/screens/projects_screen.dart';
import 'package:portfolio_app/screens/tech_screen.dart';
import 'package:portfolio_app/widgets/styled_button.dart';
import 'package:portfolio_app/widgets/styled_text.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.person});

  final Person person;

  void _changeScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    const String aboutMeText = "Sobre mi";
    final String descriptionText =
        "Soy ${person.name}, estudiante de Desarrollo de Aplicaciones Multiplataforma. Aquí puedes encontrar toda la información sobre mi perfil profesional comprimida en una app móvil.";
    const List<String> buttonTexts = [
      "Tecnologías",
      "Aptitudes",
      "Proyectos",
      "Contacto"
    ];
    const List<Color> buttonColors = [Colors.purple, Colors.pink];

    final List<Widget> screens = [
      TechnologyScreen(listTechnologies: person.listTechnologies),
      AptitudeScreen(person: person),
      ProjectsScreen(),
      ContactScreen(
        person: person,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const StyledText(
          color: Colors.white60,
          fontSize: 20,
          text: aboutMeText,
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('images/people/placeholder.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: StyledText(
              text: descriptionText,
              color: Colors.white60,
              fontSize: 15,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              itemCount: buttonTexts.length,
              itemBuilder: (context, index) {
                return StyledButton(
                  text: buttonTexts[index],
                  colors: buttonColors,
                  height: 100,
                  onTap: () => _changeScreen(context, screens[index]),
                  width: 100,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
