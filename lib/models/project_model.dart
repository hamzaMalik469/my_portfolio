class ProjectModel {
  final String name;
  final String desc;
  final String sourceCode;
  final List<String> pics;

  ProjectModel({
    required this.pics,
    required this.name,
    required this.desc,
    required this.sourceCode,
  });

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      sourceCode: map['sourceCode'] ?? '',
      pics: List<String>.from(map['pics'] ?? []),
    );
  }
}
