import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/models/person.dart';
import 'package:portfolio_app/screens/main_screen.dart';
import 'package:portfolio_app/widgets/styled_button.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 175,
              backgroundImage: facePhoto.image,
            ),
            Text(
              person.name,
              style: GoogleFonts.lato(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: buttonColors[1],
              ),
            ),
            StyledButton(
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
          ],
        ),
      ),
    );
  }
}
