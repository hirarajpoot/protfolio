import 'package:flutter/material.dart';
import '../AppScreens/profile_view.dart';
import '../AppScreens/about_me_view.dart';
import '../AppScreens/ProjectsView/projects_view.dart';
import '../../DataModal/project_model.dart'; // if needed

class AppRoutes {
  static const String profile = '/profile';
  static const String aboutMe = '/about-me';
  static const String projects = '/projects';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileView());
      case aboutMe:
        return MaterialPageRoute(builder: (_) => const AboutMeView());
        
       case projects:
        return MaterialPageRoute(
          builder: (_) => ProjectsView(projects: sampleProjects),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined')),
          ),
        );
        
    }
  }
}

// Sample dummy data for now
final sampleProjects = [
  ProjectModel(
    title: 'My Portfolio App',
    description: 'Built with Flutter and Firebase.',
    techTags: ['Flutter', 'Firebase'],
    previewImage: 'https://via.placeholder.com/300x150',
    screenshots: [
      'https://via.placeholder.com/300x600',
      'https://via.placeholder.com/300x600',
    ],
  ),
];
