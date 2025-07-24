import 'package:flutter/material.dart';
import '../../../../DataModal/project_model.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;
  final VoidCallback onTap;

  const ProjectCard({required this.project, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    const containerColor = Color(0xFF1A2E3B);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full image background card
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(10),
              image: project.previewImage != null
                  ? DecorationImage(
                      image: NetworkImage(project.previewImage!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            alignment: Alignment.center,
            child: project.previewImage == null
                ? const Text(
                    'PROJECT NAME',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 12),

          // Title and description
          Text(
            project.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600, // SemiBold
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            project.description,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(height: 8),

          // Tech tags (as skill chips style)
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: project.techTags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
