class MentorModel {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final String sector;
  final int experienceYears;
  final String domain;
  final int reviewsCount;
  final String description;
  final int compatibility;

  MentorModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.sector,
    required this.experienceYears,
    required this.domain,
    required this.reviewsCount,
    required this.description,
    required this.compatibility,
  });
}