import 'dart:convert';

import 'package:flutter/services.dart';

class AppConfig {
  final String fullName;
  final String email;
  final String gitHubLink;
  final String gitHubApiLink;
  final String phoneNumber;

  AppConfig({
    required this.fullName,
    required this.email,
    required this.gitHubLink,
    required this.gitHubApiLink,
    required this.phoneNumber,
  });

  factory AppConfig.fromJson(Map<String, dynamic> data) {
    return AppConfig(
      fullName: data['fullName'],
      email: data['email'],
      gitHubLink: data['gitHubLink'],
      gitHubApiLink: data['gitHubApiLink'],
      phoneNumber: data['phoneNumber'],
    );
  }

  static Future<AppConfig> loadConfig() async {
    final jsonString = await rootBundle.loadString('assets/config.json');
    return AppConfig.fromJson(json.decode(jsonString));
  }
}
