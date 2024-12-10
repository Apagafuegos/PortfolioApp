import 'dart:convert';

import 'package:http/http.dart' as http;

class Project {
  final String name;
  final String description;
  final String image;
  final String url;
  final String language;

  Project({
    required this.name,
    required this.description,
    required this.image,
    required this.url,
    required this.language,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      name: json['name'],
      description: json['description'] ?? 'No tiene descripción',
      image: json['image'] ?? 'images/people/placeholder.png',
      url: json['html_url'],
      language: json['language'] ?? 'No tiene un lenguaje asignado',
    );
  }

  static Future<List<Project>> fetchProject() async {
    final response = await http
        .get(Uri.parse('https://api.github.com/users/Apagafuegos/repos'));

    if (response.statusCode == 200) {
      List<Project> projects = [];
      List<dynamic> body = jsonDecode(response.body);

      for (var item in body) {
        projects.add(Project.fromJson(item));
      }
      return projects;
    } else {
      throw Exception('Failed to load project');
    }
  }
}
