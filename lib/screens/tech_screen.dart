import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_app/models/technology.dart';
import 'package:portfolio_app/widgets/styled_app_bar.dart';
import 'package:portfolio_app/widgets/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({super.key});

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
    Future<List<Technology>> listTechnologies = Technology.fetchTechnologies();

    return Scaffold(
      appBar: StyledAppbar.getStyledAppbar("Tecnologías"),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 780) {
            return FutureBuilder(
              future: listTechnologies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final tech = snapshot.data![index];
                      return Center(
                        child: SizedBox(
                          width: 780,
                          child: Card(
                            child: ListTile(
                              onTap: () => launchLink(tech.link),
                              title: StyledText(
                                text: tech.name,
                                color: Colors.blueAccent[200]!,
                                fontSize: 22,
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Container(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (var i = 0; i < tech.level; i++)
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow[400],
                                        size: 20,
                                      )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          } else {
            return FutureBuilder(
              future: listTechnologies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final tech = snapshot.data?[index];
                      return Card(
                        child: ListTile(
                          onTap: () => launchLink(tech.link),
                          title: StyledText(
                            text: tech!.name,
                            color: Colors.blueAccent[200]!,
                            fontSize: 22,
                            textAlign: TextAlign.start,
                          ),
                          subtitle: Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                for (var i = 0; i < tech.level; i++)
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow[400],
                                    size: 20,
                                  )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          }
        },
      ),
    );
  }
}
