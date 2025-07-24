import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/about_me_provider.dart';
import '../AppScreens/AboutMeView/widgets/skills_section.dart';
import '../AppScreens/AboutMeView/widgets/contacts_section.dart';

class AboutMeView extends ConsumerWidget {
  const AboutMeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(aboutMeProvider).data;
    final controller = ref.watch(aboutMeProvider);
    final theme = Theme.of(context).textTheme;
    final containerColor = const Color(0xFF1A2E3B);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const Spacer(),
                          Text(
                            'About Me',
                            style: theme.titleLarge!.copyWith(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: containerColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(color: Colors.black26, blurRadius: 4.66, offset: Offset(0, 2)),
                          ],
                        ),
                        child: TextFormField(
                          maxLines: null,
                          initialValue: model.bio,
                          onChanged: controller.updateBio,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your bio',
                            hintStyle: TextStyle(color: Colors.white54),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SkillsSection(model: model, controller: controller, containerColor: containerColor),
                      const SizedBox(height: 24),
                      ContactsSection(model: model, controller: controller, containerColor: containerColor),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: SizedBox(
                height: 62,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: containerColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/projects'),
                  child: const Text(
                    'Projects',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
