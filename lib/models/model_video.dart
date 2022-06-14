import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';    

@immutable
class VideoModel {
  final String? documentId; 
  final String? title;
  final int? order;
  final bool? active; 
  final String? thumbnail;
  final String? presenter;
  final String? description;
  final String? category;
  final String? videoId; 
  final bool? premium;
 
  const VideoModel({
    this.documentId,
    this.title,
    this.order,
    this.active, 
    this.thumbnail,
    this.presenter,
    this.description,
    this.category,
    this.videoId,
    this.premium
  });
  
  static VideoModel? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return VideoModel(
      documentId: map['documentId'] as String? ?? "Undefined",
      title: map['title'] as String? ?? "Undefined",
      order: map['order'] as int? ?? 0,
      active: map['active'] as bool? ?? true, 
      thumbnail: map['thumbnail'] as String? ?? "Undefined",
      presenter: map['presenter'] as String? ?? "Undefined",
      description: map['description'] as String? ?? "Undefined",
      category: map['category'] as String? ?? "Undefined",
      videoId: map['videoId'] as String? ?? "Undefined",
      premium: map['premium'] as bool? ?? true,
    );
  }

  factory VideoModel.fromJson(Map<String, dynamic> json) { 
    return VideoModel(
      documentId: json['documentId'] as String? ?? "Undefined", 
      title: json['title'] as String? ?? "Undefined",
      order: json['order'] as int? ?? 0,
      active: json['active'] as bool? ?? true, 
      thumbnail: json['thumbnail'] as String? ?? "Undefined",
      presenter: json['presenter'] as String? ?? "Undefined",
      description: json['description'] as String? ?? "Undefined",
      category: json['category'] as String? ?? "Undefined",
      videoId: json['videoId'] as String? ?? "Undefined",
      premium: json['premium'] as bool? ?? true,
    );
  }

  factory VideoModel.fromFirestore(DocumentSnapshot snapshot) {
    Map document = snapshot.data() as Map<String, dynamic>;
    return VideoModel( 
      documentId: document['documentId'] as String? ?? "Undefined", 
      title: document['title'] as String? ?? "Undefined",
      order: document['order'] as int? ?? 0,
      active: document['active'] as bool? ?? true, 
      thumbnail: document['thumbnail'] as String? ?? "Undefined",
      presenter: document['presenter'] as String? ?? "Undefined",
      description: document['description'] as String? ?? "Undefined",
      category: document['category'] as String? ?? "Undefined",
      videoId: document['videoId'] as String? ?? "Undefined",
      premium: document['premium'] as bool? ?? true,
    );
  }
}
