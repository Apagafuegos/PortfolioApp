import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_app/models/person.dart';
import 'package:portfolio_app/widgets/styled_app_bar.dart';
import 'package:portfolio_app/widgets/styled_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key, required this.person});

  final Person person;

  void sendEmail() async {
    String mailUrl = 'mailto:${person.email}';
    try {
      await launchUrl(Uri.parse(mailUrl));
    } catch (e) {
      await Clipboard.setData(ClipboardData(text: person.email!));
    }
  }

  void openGitHub() async {
    String url = person.github!;
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      await Clipboard.setData(ClipboardData(text: url));
    }
  }

  void callPhone() async {
    String phone = 'tel:${person.phoneNumber}';
    try {
      await launchUrl(Uri.parse(phone));
    } catch (e) {
      await Clipboard.setData(ClipboardData(text: person.phoneNumber!));
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
                          ? sendEmail()
                          : index == 1
                              ? openGitHub()
                              : callPhone();
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
