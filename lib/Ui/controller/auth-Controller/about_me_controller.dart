import '../../../DataModal/about_me_model.dart';
import 'package:flutter/material.dart';

class AboutMeController extends ChangeNotifier {
  final AboutMeModel _model = AboutMeModel(
    bio: "I'm a Flutter developer passionate about creating beautiful, responsive mobile apps with clean architecture.",
    skills: ['Flutter', 'Dart', 'Firebase', 'Figma'],
    contacts: [
      ContactItem(icon: Icons.email, value: 'hira@example.com'),
      ContactItem(icon: Icons.link, value: 'linkedin.com/in/hirabano'),
      ContactItem(icon: Icons.code, value: 'github.com/hirabano'),
    ],
  );

  AboutMeModel get data => _model;

  void updateBio(String newBio) {
    _model.bio = newBio;
    notifyListeners();
  }

  void updateSkill(int index, String newSkill) {
    _model.skills[index] = newSkill;
    notifyListeners();
  }

  void addSkill(String skill) {
    _model.skills.add(skill);
    notifyListeners();
  }

  void updateContact(int index, String newContact) {
    _model.contacts[index].value = newContact;
    notifyListeners();
  }

  void addContact(ContactItem contact) {
    _model.contacts.add(contact);
    notifyListeners();
  }
    void removeSkill(int i) {
    _model.skills.removeAt(i);
    notifyListeners();
  }

  void removeContact(int i) {
    _model.contacts.removeAt(i);
    notifyListeners();
  }

}
