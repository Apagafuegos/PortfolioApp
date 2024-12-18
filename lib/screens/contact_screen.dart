import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_app/models/person.dart';
import 'package:portfolio_app/widgets/styled_app_bar.dart';
import 'package:portfolio_app/widgets/styled_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key, required this.person});

  final Person person;

  void handleContactAction(String type) async {
    String? url;
    String? fallbackText;

    switch (type) {
      case 'Email':
        url = 'mailto:${person.email}';
        fallbackText = person.email;
        break;
      case 'GitHub':
        url = person.github;
        fallbackText = person.github;
        break;
      case 'Teléfono':
        url = 'tel:${person.phoneNumber}';
        fallbackText = person.phoneNumber;
        break;
    }

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
    var buttonTexts = ["Email", "GitHub", "Teléfono"];

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
                        : const [Colors.deepPurpleAccent, Colors.deepPurple],
                    height: 100,
                    onTap: () {
                      index == 0
                          ? handleContactAction('Email')
                          : index == 1
                              ? handleContactAction('GitHub')
                              : handleContactAction('Teléfono');
                    },
                    width: 100,
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
