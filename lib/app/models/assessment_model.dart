// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:avalie/app/models/company_model.dart';
import 'package:avalie/app/models/user_model.dart';

class AssessmentModel {
  int? id;
  UserModel? user;
  CompanyModel? company;
  int? note;
  DateTime? createdAt;


  AssessmentModel({
    this.id,
    this.user,
    this.company,
    this.note,
    this.createdAt,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user?.toMap(),
      'company': company?.toMap(),
      'note': note,
      'createdAt': createdAt?.millisecondsSinceEpoch,
    };
  }

  factory AssessmentModel.fromMap(Map<String, dynamic> map) {
    return AssessmentModel(
      id: map['id'] != null ? map['id'] as int : null,
      user: map['user'] != null ? UserModel.fromMap(map['user'] as Map<String,dynamic>) : null,
      company: map['company'] != null ? CompanyModel.fromMap(map['company'] as Map<String,dynamic>) : null,
      note: map['note'] != null ? map['note'] as int : null,
      createdAt: map['createdAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AssessmentModel.fromJson(String source) => AssessmentModel.fromMap(json.decode(source) as Map<String, dynamic>);

static List<AssessmentModel> fromList(list) {
    return List<AssessmentModel>.from(list.map((x) => AssessmentModel.fromMap(x)));
  }

  @override
  String toString() {
    return 'AssessmentModel(id: $id, user: $user, company: $company, note: $note, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant AssessmentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.user == user &&
      other.company == company &&
      other.note == note &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      user.hashCode ^
      company.hashCode ^
      note.hashCode ^
      createdAt.hashCode;
  }
}
