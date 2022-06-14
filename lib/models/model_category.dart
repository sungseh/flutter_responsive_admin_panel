import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';  

@immutable
class CategoryModel {
  final String? documentId;
  final int? categoryId;
  final String? name;
  final int? count;
  final String? image; 
  final String? icon;

  const CategoryModel({
    this.documentId,
    this.categoryId,
    this.name,
    this.count,
    this.image, 
    this.icon
  });
 
  static CategoryModel? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return CategoryModel(
      documentId: map['documentid'] as String? ?? "Undefined",
      name: map['name'] as String? ?? "Unknown",
      count: map['count'] as int? ?? 0,
      image: map['image'] as String? ?? "Unknown",
      icon: map['icon'] as String? ?? "Unknown",
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) { 
    return CategoryModel(
      documentId: json['documentId'] as String? ?? 'Unknown',
      name: json['name'] as String? ?? 'Unknown',
      count: json['count'] as int? ?? 0,
      image: json['image'] as String? ?? 'Unknown',
      icon: json['icon'] as String? ?? 'Unknown',
    );
  }

  factory CategoryModel.fromFirestore(DocumentSnapshot snapshot) { 
    Map document = snapshot.data() as Map<String, dynamic>; 
    return CategoryModel( 
      documentId: document['documentId'] as String? ?? 'Unknown',
      name: document['name'] as String? ?? 'Unknown',
      count: document['count'] as int? ?? 0,
      image: document['image'] as String? ?? 'Unknown',
      icon: document['icon'] as String? ?? 'Unknown',
    );
  }
}
