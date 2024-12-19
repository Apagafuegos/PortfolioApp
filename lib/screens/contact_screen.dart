import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_app/models/person.dart';
import 'package:portfolio_app/widgets/styled_app_bar.dart';
import 'package:portfolio_app/widgets/styled_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key, required this.person});

  final Person person;

  Future<void> handleContactAction(String type) async {
    final Map<String, String?> contactInfo = {
      'Email': 'mailto:${person.email}',
      'GitHub': person.github,
      'Teléfono': 'tel:${person.phoneNumber}',
    };

    final url = contactInfo[type];
    final fallbackText = type == 'Email'
        ? person.email
        : type == 'GitHub'
            ? person.github
            : person.phoneNumber;

    if (url != null) {
      try {
        await launchUrl(Uri.parse(url));
      } catch (e) {
        if (fallbackText != null) {
          await Clipboard.setData(ClipboardData(text: fallbackText));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const buttonTexts = ["Email", "GitHub", "Teléfono"];

    return Scaffold(
      appBar: StyledAppbar.getStyledAppbar("Contacte conmigo"),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SizedBox(
              width: constraints.maxWidth > 600 ? 600 : constraints.maxWidth,
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 3,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                ),
                itemCount: buttonTexts.length,
                itemBuilder: (context, index) {
                  return StyledButton(
                    text: buttonTexts[index],
                    colors: index == 1
                        ? const [Colors.black, Colors.black12]
                        : [Colors.blueAccent[200]!, Colors.lightBlue[400]!],
                    height: 100,
                    onTap: () {
                      handleContactAction(buttonTexts[index]);
                    },
                    width: 100,
                    fontSize: 25,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
