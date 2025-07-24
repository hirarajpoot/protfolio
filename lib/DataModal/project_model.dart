class ProjectModel {
  final String title;
  final String description;
  final List<String> techTags;
  final String? previewImage;
  final List<String> screenshots;

  ProjectModel({
    required this.title,
    required this.description,
    required this.techTags,
    this.previewImage,
    this.screenshots = const [],
  });
}
