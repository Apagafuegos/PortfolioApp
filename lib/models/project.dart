import 'dart:convert';
import 'package:http/http.dart' as http;

class Project {
  final String name;
  final String description;
  final String image;
  final String url;
  final String language;
  final String linesOfCodeLink;
  Map<String, int> linesOfCode = {};
  String? longDescription;

  Project({
    required this.name,
    required this.description,
    required this.image,
    required this.url,
    required this.language,
    required this.linesOfCodeLink,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'],
      description: json['description'] ?? 'No tiene descripción',
      image: json['image'] ?? 'assets/people/placeholder.png',
      url: json['html_url'],
      language: json['language'] ?? 'No tiene lenguaje asignado',
      linesOfCodeLink: json['languages_url'],
    );
  }

  static Future<List<Project>> fetchProjects(String gitHubApiLink) async {
    final response = await http.get(Uri.parse(gitHubApiLink));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      var list = body.map((dynamic item) => Project.fromJson(item)).toList();
      for (var project in list) {
        project.linesOfCode = await project._fetchLinesOfCode();
      }
      return list;
    } else {
      throw Exception('Failed to load projects');
    }
  }

  Future<Map<String, int>> _fetchLinesOfCode() async {
    final response = await http.get(Uri.parse(linesOfCodeLink));

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      return body.map((key, value) => MapEntry(key, value));
    } else {
      throw Exception('Failed to load lines of code');
    }
  }
}
