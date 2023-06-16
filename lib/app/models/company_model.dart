// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:avalie/app/models/assessment_model.dart';

class CompanyModel {
  int? id;
  String? name;
  String? branch;
  String? city;
  DateTime? createdAt;
  List<AssessmentModel>? assessments;
  
  CompanyModel({
    this.id,
    this.name,
    this.branch,
    this.city,
    this.createdAt,
    this.assessments,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'branch': branch,
      'city': city,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'assessments': assessments?.map((x) => x.toMap()).toList(),
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      branch: map['branch'] != null ? map['branch'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      createdAt: map['createdAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int) : null,
      assessments: map['assessments'] != null ? List<AssessmentModel>.from((map['assessments'] as List<dynamic>).map<AssessmentModel?>((x) => AssessmentModel.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source) as Map<String, dynamic>);

static List<CompanyModel> fromList(list) {
    return List<CompanyModel>.from(list.map((x) => CompanyModel.fromMap(x)));
  }


  @override
  bool operator ==(covariant CompanyModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.branch == branch &&
      other.city == city &&
      other.createdAt == createdAt &&
      listEquals(other.assessments, assessments);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      branch.hashCode ^
      city.hashCode ^
      createdAt.hashCode ^
      assessments.hashCode;
  }

  @override
  String toString() {
    return 'CompanyModel(id: $id, name: $name, branch: $branch, city: $city, createdAt: $createdAt, assessments: $assessments)';
  }
}
