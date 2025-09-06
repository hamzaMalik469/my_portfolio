class AboutModel {
  final String profession;
  final String professionSummary;
  final String profileImage;
  final String background;
  final String shortIntro;
  final List<String> skills;
  final List<String> contactList;
  final String resumeUrl;

  AboutModel({
    required this.contactList,
    required this.shortIntro,
    required this.skills,
    required this.resumeUrl,
    required this.background,
    required this.profession,
    required this.professionSummary,
    required this.profileImage,
  });

  factory AboutModel.fromMap(Map<String, dynamic> map) {
    return AboutModel(
      resumeUrl: map['resumeUrl'] ?? '',
      profession: map['profession'] ?? '',
      professionSummary: map['professionSummary'] ?? '',
      profileImage: map['profileImage'] ?? '',
      background: map['background'] ?? '',
      shortIntro: map['shortIntro'] ?? '',
      skills: List<String>.from(map['skills'] ?? []),
      contactList: List<String>.from(map['contactList'] ?? []),
    );
  }
}
