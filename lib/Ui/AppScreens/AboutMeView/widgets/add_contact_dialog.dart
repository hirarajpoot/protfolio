import 'package:flutter/material.dart';
import '../../../../DataModal/about_me_model.dart';

class AddContactDialog extends StatefulWidget {
  final ContactItem? initial;

  const AddContactDialog({this.initial, super.key});

  @override
  State<AddContactDialog> createState() => _AddContactDialogState();
}

class _AddContactDialogState extends State<AddContactDialog> {
  IconData selectedIcon = Icons.email;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Contact'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton<IconData>(
            value: selectedIcon,
            items: const [
              DropdownMenuItem(value: Icons.email, child: Text('Email')),
              DropdownMenuItem(value: Icons.phone, child: Text('Phone')),
              DropdownMenuItem(value: Icons.link, child: Text('LinkedIn')),
              DropdownMenuItem(value: Icons.code, child: Text('GitHub')),
            ],
            onChanged: (icon) => setState(() => selectedIcon = icon!),
          ),
          TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter contact'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final newContact = ContactItem(
              icon: selectedIcon,
              value: controller.text,
            );
            Navigator.pop(context, newContact);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
