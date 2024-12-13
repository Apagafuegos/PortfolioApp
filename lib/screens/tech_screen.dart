import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_app/models/technology.dart';
import 'package:portfolio_app/widgets/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({super.key, required this.listTechnologies});

  final List<Technology> listTechnologies;

  void launchLink(String url) async {
    var urlParsed = Uri.parse(url);
    try {
      await launchUrl(urlParsed);
    } catch (e) {
      await Clipboard.setData(ClipboardData(text: url));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> listLinks = [
      'https://flutter.dev/',
      'https://www.java.com/en/',
      'https://spring.io/',
      'https://ionicframework.com/',
      'https://en.wikipedia.org/wiki/SQL',
      'https://www.rust-lang.org/',
      'https://developer.mozilla.org/en/docs/Web/HTML',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const StyledText(
          color: Colors.white60,
          fontSize: 20,
          text: "Mis tecnologías",
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 780) {
            return ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: listTechnologies.length,
              itemBuilder: (context, index) {
                final tech = listTechnologies[index];
                return Center(
                  child: SizedBox(
                    width: 780,
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          launchLink(listLinks[index]);
                        },
                        title: StyledText(
                          text: tech.name,
                          color: Colors.purple,
                          fontSize: 22,
                          textAlign: TextAlign.center,
                        ),
                        subtitle: StyledText(
                          text: tech.description,
                          color: Colors.white70,
                          fontSize: 14,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: listTechnologies.length,
              itemBuilder: (context, index) {
                final tech = listTechnologies[index];
                return Card(
                  child: ListTile(
                    title: StyledText(
                      text: tech.name,
                      color: Colors.purple,
                      fontSize: 22,
                      textAlign: TextAlign.start,
                    ),
                    subtitle: StyledText(
                      text: tech.description,
                      color: Colors.white70,
                      fontSize: 14,
                      textAlign: TextAlign.start,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
