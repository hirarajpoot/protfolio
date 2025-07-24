import 'package:flutter/material.dart';

class SkillEditDialog extends StatelessWidget {
  final String skill;
  const SkillEditDialog({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: skill);
    return AlertDialog(
      title: const Text('Edit Skill'),
      content: TextField(controller: controller),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, controller.text),
          child: const Text('Save'),
        ),
      ],
    );
  }
}
