import 'package:flutter/material.dart';
import 'package:portfolio_app/models/person.dart';
import 'package:portfolio_app/screens/competences_screen.dart';
import 'package:portfolio_app/screens/contact_screen.dart';
import 'package:portfolio_app/screens/projects_screen.dart';
import 'package:portfolio_app/screens/tech_screen.dart';
import 'package:portfolio_app/widgets/styled_app_bar.dart';
import 'package:portfolio_app/widgets/styled_button.dart';
import 'package:portfolio_app/widgets/styled_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.person});

  final Person person;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _changeScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      _createRoute(screen),
    );
  }

  //Animation between main screen and the rest of them
  Route _createRoute(Widget screen) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          final tween = Tween(begin: begin, end: end);
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );
          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    const String aboutMeText = "Sobre mi";
    final String descriptionText =
        "Soy ${widget.person.name}, estudiante de Desarrollo de Aplicaciones Multiplataforma. Aquí puedes encontrar toda la información sobre mi perfil profesional comprimida en una app móvil.";
    const List<String> buttonTexts = [
      "Tecnologías",
      "Competencias",
      "Proyectos",
      "Contacto"
    ];
    List<Color> buttonColors = [
      Colors.blueAccent[200]!,
      Colors.lightBlue[400]!
    ];

    final List<Widget> screens = [
      const TechnologyScreen(),
      CompetenceScreen(person: widget.person),
      ProjectsScreen(person: widget.person),
      ContactScreen(person: widget.person),
    ];

    return Scaffold(
      appBar: StyledAppbar.getStyledAppbar(aboutMeText),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 780) {
            return Column(
              children: [
                Center(
                  child: SizedBox(
                    width: constraints.maxWidth * 0.7,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: buttonColors,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              radius: 150,
                              backgroundImage: AssetImage(widget.person.photo),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Center(
                            child: SizedBox(
                              width: 780,
                              child: StyledText(
                                text: descriptionText,
                                color: Colors.white60,
                                fontSize: 15,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: SizedBox(
                      width: 780,
                      child: AnimatedBuilder(
                        animation: _animationController,
                        child: GridView.builder(
                          padding: const EdgeInsets.all(16),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 4,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 30,
                          ),
                          itemCount: buttonTexts.length,
                          itemBuilder: (context, index) {
                            return StyledButton(
                              text: buttonTexts[index],
                              colors: buttonColors,
                              height: 100,
                              onTap: () =>
                                  _changeScreen(context, screens[index]),
                              width: 100,
                              fontSize: 25,
                            );
                          },
                        ),
                        builder: (context, child) {
                          return Padding(
                            padding: EdgeInsets.only(
                              top: 100 - _animationController.value * 100,
                            ),
                            child: child,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: buttonColors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage(widget.person.photo),
                    ),
                  ),
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
                  child: AnimatedBuilder(
                    animation: _animationController,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
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
                          fontSize: 20,
                        );
                      },
                    ),
                    builder: (context, child) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: 100 - _animationController.value * 100,
                        ),
                        child: child,
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
