import 'dart:convert';
import 'package:http/http.dart' as http;

class Project {
  final String name;
  final String description;
  final String image;
  final String url;
  final String language;
  String? longDescription;

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
      image: json['image'] ?? 'assets/people/placeholder.png',
      url: json['html_url'],
      language: json['language'] == 'C++'
          ? 'Flutter'
          : json['language'] ?? 'No tiene lenguaje asignado',
    );
  }

  static Future<List<Project>> fetchProjects(String gitHubApiLink) async {
    final response = await http.get(Uri.parse(gitHubApiLink));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Project.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load projects');
    }
  }
}
