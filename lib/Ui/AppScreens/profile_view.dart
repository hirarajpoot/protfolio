import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../provider/profile_provider.dart';
import '../provider/image_provider.dart';
import '../AppScreens/ProfileScreen/widgets/rounded_button.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageController = ref.watch(imageControllerProvider);
    final imagePath = imageController.image;
   final profileAsync = ref.watch(firebaseProfileProvider);


    return Scaffold(
      body: SafeArea(
        child: Center(
          child: profileAsync.when(
            loading: () => const CircularProgressIndicator(),
            error: (e, _) => Text('Error: $e', style: const TextStyle(color: Colors.white)),
            data: (user) => Column(
              children: [
                const SizedBox(height: 60),

                // Avatar with image picker
                GestureDetector(
                  onTap: () => ref.read(imageControllerProvider).pickImage(),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: imagePath != null
                        ? FileImage(imagePath)
                        : NetworkImage(user.image) as ImageProvider,
                  ),
                ),

                const SizedBox(height: 20),

                // Name
                Text(
                  user.name,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                ),

                const SizedBox(height: 8),

                // Role
                Text(
                  user.role,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontFamily: 'Inter',
                        color: Colors.white70,
                      ),
                ),

                const Spacer(),

                // View Button
                RoundedButton(
                  label: 'VIEW',
                  onPressed: () {
                    Navigator.pushNamed(context, '/about-me');
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
