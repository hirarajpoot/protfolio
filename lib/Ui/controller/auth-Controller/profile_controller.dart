import '../../../DataModal/user_model.dart';

class DummyProfileController {
  UserModel getUser() {
    return UserModel(
      name: 'Hira Shah',
      role: 'Flutter Developer',
      image: 'https://www.vectorstock.com/royalty-free-vector/spanish-word-for-portfolio-with-colorful-paint-vector-56800888',
    );
  }
}
