import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../DataModal/about_me_model.dart';
import '../widgets/add_contact_dialog.dart';

class ContactsSection extends StatelessWidget {
  final AboutMeModel model;
  final controller;
  final Color containerColor;

  const ContactsSection({required this.model, required this.controller, required this.containerColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact', style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
        ),
        const SizedBox(height: 12),
        Column(
          children: [
            for (int i = 0; i < model.contacts.length; i++)
              GestureDetector(
                onTap: () => _launchContact(model.contacts[i], context),
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
                          final newContact = await showDialog<ContactItem>(
                            context: context,
                            builder: (_) => AddContactDialog(initial: model.contacts[i]),
                          );
                          if (newContact != null) controller.updateContact(i, newContact.value);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.delete, color: Colors.redAccent),
                        title: const Text('Delete', style: TextStyle(color: Colors.redAccent)),
                        onTap: () {
                          Navigator.pop(context);
                          controller.removeContact(i);
                        },
                      ),
                    ],
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(color: containerColor, borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: Icon(model.contacts[i].icon, color: Colors.white),
                    title: TextFormField(
                      initialValue: model.contacts[i].value,
                      onChanged: (val) => controller.updateContact(i, val),
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 8),
            TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: containerColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () async {
                final newContact = await showDialog<ContactItem>(
                  context: context,
                  builder: (_) => const AddContactDialog(),
                );
                if (newContact != null) controller.addContact(newContact);
              },
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text('Add Contact', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _launchContact(ContactItem item, BuildContext context) async {
    final value = item.value.trim();
    Uri? uri;
    if (value.contains('linkedin.com') || value.contains('github.com')) {
      uri = Uri.parse(value.startsWith('http') ? value : 'https://$value');
    } else if (value.contains('@')) {
      uri = Uri.parse('mailto:$value');
    } else if (RegExp(r'^[0-9+]+$').hasMatch(value)) {
      uri = Uri.parse('tel:$value');
    }
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $value')),
      );
    }
  }
}
