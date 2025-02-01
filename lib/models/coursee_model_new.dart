

class Course {
  final String id;
  final String title;
  final String description;
  final double price;
  final bool isFree;
  final double priceWithDiscount;
  final double discountPercent;
  final String image;
  final String thumbnail;
  final String type;
  final String link;
  final int duration;
  final String category;
  final Teacher? teacher;
  final int studentsCount;
  final int reviewsCount;
  final double rating;
  final String status;
  final int progressPercent;
  final List<String> lessons;
  final int lessonsCount;
  final List<String> badges;
  final List<Translation> translations;
  final bool subscriptionIncluded;
  final String createdAt;
  final String updatedAt;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.isFree,
    required this.priceWithDiscount,
    required this.discountPercent,
    required this.image,
    required this.thumbnail,
    required this.type,
    required this.link,
    required this.duration,
    required this.category,
    this.teacher,
    required this.studentsCount,
    required this.reviewsCount,
    required this.rating,
    required this.status,
    required this.progressPercent,
    required this.lessons,
    required this.lessonsCount,
    required this.badges,
    required this.translations,
    required this.subscriptionIncluded,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      isFree: json['isFree'] ?? false,
      priceWithDiscount: (json['priceWithDiscount'] as num?)?.toDouble() ?? 0.0,
      discountPercent: (json['discountPercent'] as num?)?.toDouble() ?? 0.0,
      image: json['image'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      type: json['type'] ?? '',
      link: json['link'] ?? '',
      duration: json['duration'] ?? 0,
      category: json['category'] ?? '',
      teacher: json['teacher'] != null && json['teacher'] is Map<String, dynamic>
          ? Teacher.fromJson(json['teacher'])
          : null,
      studentsCount: json['studentsCount'] ?? 0,
      reviewsCount: json['reviewsCount'] ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] ?? '',
      progressPercent: json['progressPercent'] ?? 0,
      lessons: (json['lessons'] as List?)?.whereType<String>().toList() ?? [],
      lessonsCount: json['lessonsCount'] ?? 0,
      badges: (json['badges'] as List?)?.whereType<String>().toList() ?? [],
      translations: (json['translations'] as List?)
              ?.whereType<Map<String, dynamic>>()
              .map((e) => Translation.fromJson(e))
              .toList() ??
          [],
      subscriptionIncluded: json['subscriptionIncluded'] ?? false,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'price': price,
      'isFree': isFree,
      'priceWithDiscount': priceWithDiscount,
      'discountPercent': discountPercent,
      'image': image,
      'thumbnail': thumbnail,
      'type': type,
      'link': link,
      'duration': duration,
      'category': category,
      'teacher': teacher?.toJson(),
      'studentsCount': studentsCount,
      'reviewsCount': reviewsCount,
      'rating': rating,
      'status': status,
      'progressPercent': progressPercent,
      'lessons': lessons,
      'lessonsCount': lessonsCount,
      'badges': badges,
      'translations': translations.map((e) => e.toJson()).toList(),
      'subscriptionIncluded': subscriptionIncluded,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

class Teacher {
  String? id;
  String? name;
  String? email;

  Teacher({this.id, this.name, this.email});

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
    };
  }
}

class Translation {
  String? language;
  String? title;
  String? description;
  String? id;

  Translation({this.language, this.title, this.description, this.id});

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      language: json['language'],
      title: json['title'],
      description: json['description'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'language': language,
      'title': title,
      'description': description,
      '_id': id,
    };
  }
}
