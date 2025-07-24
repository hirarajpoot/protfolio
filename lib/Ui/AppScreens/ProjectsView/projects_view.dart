import 'package:flutter/material.dart';
import '../../../DataModal/project_model.dart';
import 'widgets/project_card.dart';
import 'project_details_view.dart';

class ProjectsView extends StatelessWidget {
  final List<ProjectModel> projects;

  const ProjectsView({required this.projects, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1E2D),
      body: SafeArea(
        child: Column(
          children: [
            // Header with Back Button and Center Title
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const Text(
                    'Projects',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),

            // List of Projects
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: projects.length,
                itemBuilder: (context, i) {
                  final p = projects[i];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ProjectCard(
                      project: p,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProjectDetailsView(project: p),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
