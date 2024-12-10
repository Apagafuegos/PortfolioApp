import 'package:portfolio_app/models/project.dart';
import 'package:portfolio_app/models/technology.dart';

class Person {
  final String name;
  final String photo;
  final List<Technology> listTechnologies;
  List<Project>? listProjects;
  String? email;
  String? github;
  String? phoneNumber;

  Person({
    required this.name,
    required this.photo,
    required this.listTechnologies,
  });
}
