import 'package:flutter/material.dart';
import '../../../../DataModal/about_me_model.dart';
import '..//widgets/skill_edit_dialog.dart';
// import 'package:url_launcher/url_launcher.dart';

class SkillsSection extends StatelessWidget {
  final AboutMeModel model;
  final controller;
  final Color containerColor;

  const SkillsSection({required this.model, required this.controller, required this.containerColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Skills', style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (int i = 0; i < model.skills.length; i++)
              GestureDetector(
                onLongPress: () => showModalBottomSheet(
                  context: context,
                  backgroundColor: containerColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  builder: (_) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.edit, color: Colors.white),
                        title: const Text('Edit', style: TextStyle(color: Colors.white)),
                        onTap: () async {
                          Navigator.pop(context);
                          final newSkill = await showDialog<String>(
                            context: context,
                            builder: (_) => SkillEditDialog(skill: model.skills[i]),
                          );
                          if (newSkill != null) controller.updateSkill(i, newSkill);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.delete, color: Colors.redAccent),
                        title: const Text('Delete', style: TextStyle(color: Colors.redAccent)),
                        onTap: () {
                          Navigator.pop(context);
                          controller.removeSkill(i);
                        },
                      ),
                    ],
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  margin: const EdgeInsets.only(bottom: 6),
                  decoration: BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(20)),
                  child: Text(model.skills[i], style: const TextStyle(color: Colors.white)),
                ),
              ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: containerColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              icon: const Icon(Icons.add),
              label: const Text('Add Skill'),
              onPressed: () async {
                final newSkill = await showDialog<String>(
                  context: context,
                  builder: (_) => SkillEditDialog(skill: ''),
                );
                if (newSkill != null) controller.addSkill(newSkill);
              },
            ),
          ],
        ),
      ],
    );
  }
}
