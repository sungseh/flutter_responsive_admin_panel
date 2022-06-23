import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';  

@immutable
class AudioModel {
  final String? documentId; 
  final String? title;
  final String? presenter;
  final String? image;
  final String? url;
  final String? category; 
  final bool? active; 
  final int? duration;
  final bool? premium;
 
  const AudioModel({
    this.documentId,
    this.title, 
    this.presenter, 
    this.image, 
    this.url, 
    this.category,
    this.active, 
    this.duration,
    this.premium,
  });
 
  static AudioModel? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return AudioModel(
      documentId: map['documentId'] as String? ?? "",
      title: map['title'] as String? ?? "",
      presenter: map['presenter'] as String? ?? "",
      image: map['cover'] as String? ?? "",
      url: map['audioUrl'] as String? ?? "",
      category: map['category'] as String? ?? "",
      duration: map['duration'] as int?,
      active: map['active'] as bool? ?? true, 
      premium: map['premium'] as bool? ?? true,
    );
  }

  factory AudioModel.fromJson(Map<String, dynamic> json) {  
    return AudioModel(
      documentId: json['documentId'] as String? ?? "",
      title: json['title'] as String? ?? "",
      presenter: json['presenter'] as String? ?? "",
      image: json['cover'] as String? ?? "",
      url: json['audioUrl'] as String? ?? "",
      category: json['category'] as String? ?? "",  
      active: json['active'] as bool? ?? true, 
      duration: json['duration'] as int?,
      premium: json['premium'] as bool? ?? true,
    );
  }

  factory AudioModel.fromFirestore(DocumentSnapshot snapshot) {
    Map document = snapshot.data() as Map<String, dynamic>; 
    return AudioModel( 
      documentId: document['documentId'] as String? ?? "",
      title: document['title'] as String? ?? "",
      presenter: document['presenter'] as String? ?? "",
      image: document['cover'] as String? ?? "",
      url: document['audioUrl'] as String? ?? "",
      category: document['category'] as String? ?? "",  
      active: document['active'] as bool? ?? true, 
      duration: document['duration'] as int?,
      premium: document['premium'] as bool? ?? true,
    );
  }
}
