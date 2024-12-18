import 'package:flutter/material.dart';
import 'package:portfolio_app/models/person.dart';
import 'package:portfolio_app/screens/main_screen.dart';
import 'package:portfolio_app/widgets/styled_button.dart';
import 'package:portfolio_app/widgets/styled_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.facePhoto, required this.person});

  final Person person;
  final Image facePhoto;

  @override
  Widget build(BuildContext context) {
    const String knowAboutMeText = '¡Conóceme!';
    final List<Color> buttonColors = [
      Colors.purple[900]!,
      Colors.purple,
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        radius: constraints.maxWidth > 900 ? 200 : 150,
                        backgroundImage: facePhoto.image,
                      ),
                    ),
                  ),
                  StyledText(
                      text: person.name,
                      color: Colors.purple,
                      fontSize: constraints.maxWidth > 900 ? 40 : 30,
                      textAlign: TextAlign.center),
                  SizedBox(
                    width: constraints.maxWidth > 900
                        ? constraints.maxWidth * 0.4
                        : double.infinity,
                    child: StyledButton(
                      text: knowAboutMeText,
                      colors: buttonColors,
                      height: 100.0,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(person: person),
                        ),
                      ),
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
