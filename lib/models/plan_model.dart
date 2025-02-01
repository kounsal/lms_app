import 'dart:convert';

class PlanModel {
  final String id;
  final String name;
  final int validity;
  final int duration;
  final double price;
  final List<String> includedCourses; // Assuming includedCourses are String IDs
  final String description;
  final bool isActive;
  final String thumbnail; // New field for the PlanModel thumbnail URL
  final DateTime createdAt;
  final DateTime updatedAt;

  PlanModel({
    required this.id,
    required this.name,
    required this.validity,
    required this.duration,
    required this.price,
    required this.includedCourses,
    required this.description,
    required this.isActive,
    required this.thumbnail,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create PlanModel from JSON
  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      validity: json['validity'] ?? 0,
      duration: json['duration'] ?? 0,
      price: json['price']?.toDouble() ?? 0.0,
      includedCourses: List<String>.from(json['includedCourses'] ?? []),
      description: json['description'] ?? '',
      isActive: json['isActive'] ?? false,
      thumbnail: json['thumbnail'] ?? '', // Parse the thumbnail field
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toString()),
    );
  }

  // Method to convert PlanModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'validity': validity,
      'duration': duration,
      'price': price,
      'includedCourses': includedCourses,
      'description': description,
      'isActive': isActive,
      'thumbnail': thumbnail, // Include the thumbnail field
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
