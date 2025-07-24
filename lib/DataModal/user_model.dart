class UserModel {
  final String name;
  final String role;
  final String image;

  UserModel({
    required this.name,
    required this.role,
    required this.image,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'] ?? '',
      role: data['role'] ?? '',
      image: data['image'] ?? '',
    );
  }
}
