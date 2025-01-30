import 'dart:convert';

class UserModel {
  final String? id;
 String? fullname;
 String? email;
 String? password;
  final String? role;
  final List<PurchasedCourse>? purchasedCourses;
  final List<String>? subscriptions;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? version;
  final String? avatar;
  final String? college;
  final String? phone;
  final String? preparingFor;
  final String? state;
  final List<String>? courses;
  final bool? profileCreated;
  final int? yearOfAdmission;

  UserModel({
    this.id,
    this.fullname,
    this.email,
    this.password,
    this.role,
    this.purchasedCourses,
    this.subscriptions,
    this.createdAt,
    this.updatedAt,
    this.version,
    this.avatar,
    this.college,
    this.phone,
    this.preparingFor,
    this.state,
    this.courses,
    this.profileCreated,
    this.yearOfAdmission,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["_id"],
      fullname: json["name"],
      email: json["email"],
      password: json["password"],
      role: json["role"],
      purchasedCourses: (json["purchasedCourses"] as List?)
          ?.map((e) => PurchasedCourse.fromJson(e))
          .toList(),
      subscriptions: (json["subscriptions"] as List?)?.cast<String>(),
      createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
      updatedAt: json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
      version: json["__v"],
      avatar: json["avatar"],
      college: json["college"],
      phone: json["phone"],
      preparingFor: json["preparingFor"],
      state: json["state"],
      courses: (json["courses"] as List?)?.cast<String>(),
      profileCreated: json["profileCreated"],
      yearOfAdmission: json["yearOfAdmission"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": fullname,
      "email": email,
      "password": password,
      "role": role,
      "purchasedCourses": purchasedCourses?.map((e) => e.toJson()).toList(),
      "subscriptions": subscriptions,
      "createdAt": createdAt?.toIso8601String(),
      "updatedAt": updatedAt?.toIso8601String(),
      "__v": version,
      "avatar": avatar,
      "college": college,
      "phone": phone,
      "preparingFor": preparingFor,
      "state": state,
      "courses": courses,
      "profileCreated": profileCreated,
      "yearOfAdmission": yearOfAdmission,
    };
  }
}

class PurchasedCourse {
  final String? id;
  final String? title;
  final String? description;
  final int? price;
  final bool? isFree;
  final int? priceWithDiscount;
  final int? discountPercent;
  final String? image;
  final String? thumbnail;
  final String? type;
  final int? duration;
  final String? teacher;
  final int? studentsCount;
  final int? reviewsCount;
  final int? rating;
  final String? status;
  final int? progressPercent;
  final List<String>? lessons;
  final int? lessonsCount;
  final List<String>? badges;
  final bool? subscriptionIncluded;
  final List<String>? translations;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? version;
  final String? link;

  PurchasedCourse({
    this.id,
    this.title,
    this.description,
    this.price,
    this.isFree,
    this.priceWithDiscount,
    this.discountPercent,
    this.image,
    this.thumbnail,
    this.type,
    this.duration,
    this.teacher,
    this.studentsCount,
    this.reviewsCount,
    this.rating,
    this.status,
    this.progressPercent,
    this.lessons,
    this.lessonsCount,
    this.badges,
    this.subscriptionIncluded,
    this.translations,
    this.createdAt,
    this.updatedAt,
    this.version,
    this.link,
  });

  factory PurchasedCourse.fromJson(Map<String, dynamic> json) {
    return PurchasedCourse(
      id: json["_id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      isFree: json["isFree"],
      priceWithDiscount: json["priceWithDiscount"],
      discountPercent: json["discountPercent"],
      image: json["image"],
      thumbnail: json["thumbnail"],
      type: json["type"],
      duration: json["duration"],
      teacher: json["teacher"],
      studentsCount: json["studentsCount"],
      reviewsCount: json["reviewsCount"],
      rating: json["rating"],
      status: json["status"],
      progressPercent: json["progressPercent"],
      lessons: (json["lessons"] as List?)?.cast<String>(),
      lessonsCount: json["lessonsCount"],
      badges: (json["badges"] as List?)?.cast<String>(),
      subscriptionIncluded: json["subscriptionIncluded"],
      translations: (json["translations"] as List?)?.cast<String>(),
      createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
      updatedAt: json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
      version: json["__v"],
      link: json["link"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "title": title,
      "description": description,
      "price": price,
      "isFree": isFree,
      "priceWithDiscount": priceWithDiscount,
      "discountPercent": discountPercent,
      "image": image,
      "thumbnail": thumbnail,
      "type": type,
      "duration": duration,
      "teacher": teacher,
      "studentsCount": studentsCount,
      "reviewsCount": reviewsCount,
      "rating": rating,
      "status": status,
      "progressPercent": progressPercent,
      "lessons": lessons,
      "lessonsCount": lessonsCount,
      "badges": badges,
      "subscriptionIncluded": subscriptionIncluded,
      "translations": translations,
      "createdAt": createdAt?.toIso8601String(),
      "updatedAt": updatedAt?.toIso8601String(),
      "__v": version,
      "link": link,
    };
  }
}
