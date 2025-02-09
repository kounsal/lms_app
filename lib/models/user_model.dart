import 'dart:convert';

import 'package:lms_app/models/coursee_model_new.dart';
import 'package:lms_app/models/exam_model.dart';

class UserModel {
  final String? id;
 String? fullname;
 String? email;
 String? password;
  final String? role;
 List<Course>? purchasedCourses;
 List<ExamModel>? purchasedExam;
  final List<String>? subscriptions;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? version;
  final String? avatar;
   String? college;
   String? phone;
   String? preparingFor;
   String? state;
  final List<String>? courses;
  bool? profileCreated;
   int? yearOfAdmission;

  UserModel({
    this.purchasedExam,
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
      purchasedCourses: json["purchasedCourses"] != null ? (json["purchasedCourses"] as List?)
          ?.map((e) => Course.fromJson(e))
          .toList() : [],
      purchasedExam:json["purchasedExams"] !=null ? (json["purchasedExams"] as List?)
          ?.map((e) => ExamModel.fromJsonPay(e))
          .toList() : [],
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
      "purchasedExams" : purchasedExam?.map((e) => e.toJson()).toList(),
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


