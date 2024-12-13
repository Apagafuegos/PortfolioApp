import 'package:portfolio_app/models/project.dart';
import 'package:portfolio_app/models/technology.dart';

class Person {
  final String name;
  final String photo;
  final List<Technology> listTechnologies;
  final List<String> listCompetences;
  List<Project>? listProjects;
  String? email;
  String? github;
  String? githubApi;
  String? phoneNumber;

  Person({
    required this.name,
    required this.photo,
    required this.listTechnologies,
    required this.listCompetences,
  });
}
