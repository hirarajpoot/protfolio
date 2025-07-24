import 'package:flutter/material.dart';


class AboutMeModel {
  String bio;
  List<String> skills;
  List<ContactItem> contacts;

  AboutMeModel({
    required this.bio,
    required this.skills,
    required this.contacts,
  });
}

class ContactItem {
  final IconData icon;
  String value;

  ContactItem({required this.icon, required this.value});
}
