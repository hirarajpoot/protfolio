import 'package:flutter/material.dart';
import '../../../DataModal/project_model.dart';

class ProjectDetailsView extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailsView({required this.project, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
        backgroundColor: const Color(0xFF0B1E2D),
      ),
      backgroundColor: const Color(0xFF0B1E2D),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (project.previewImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(project.previewImage!),
              ),
            const SizedBox(height: 16),
            Text(
              project.title,
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              project.description,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: project.techTags.map((t) => Chip(
                label: Text(t, style: const TextStyle(color: Colors.white)),
                backgroundColor: Colors.blueGrey,
              )).toList(),
            ),
            const SizedBox(height: 20),
            if (project.screenshots.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Screenshots', style: TextStyle(color: Colors.white, fontSize: 18)),
                  const SizedBox(height: 12),
                  ...project.screenshots.map((url) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  )),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
