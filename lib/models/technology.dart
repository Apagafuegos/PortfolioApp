import 'dart:convert';

import 'package:flutter/services.dart';

class Technology {
  final String name;
  final int level;
  final String link;

  Technology({
    required this.name,
    required this.level,
    required this.link,
  });

  factory Technology.fromJson(Map<String, dynamic> json) {
    return Technology(
      name: json['name'],
      level: json['level'],
      link: json['link'],
    );
  }

  static Future<List<Technology>> fetchTechnologies() async {
    final jsonString = await rootBundle.loadString('assets/technologies.json');
    List<dynamic> body = jsonDecode(jsonString);
    return body.map((dynamic item) => Technology.fromJson(item)).toList();
  }
}
