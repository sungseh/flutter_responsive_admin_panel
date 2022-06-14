import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_responsive_admin_panel/models/model_category.dart';
import 'package:flutter_responsive_admin_panel/models/model_audio.dart';
import 'package:flutter_responsive_admin_panel/repositories/abstract/admin_repo.dart';

class AdminFirestore implements AdminRepo { 
  final audioCollection = FirebaseFirestore.instance.collection('audios');
  final videoCollection = FirebaseFirestore.instance.collection('videos');
  final presenterCollection = FirebaseFirestore.instance.collection('teachers');
  final categoryCollection = FirebaseFirestore.instance.collection('category');

  @override
  Stream<List<AudioModel>> audiosList() { 
    return audioCollection.snapshots().map((snapshot) {
      return snapshot.docs
        .map((doc) => AudioModel.fromFirestore(doc))
        .toList(); 
    });
  }

  @override
  Stream<List<CategoryModel>> categoriesList() {
    return categoryCollection.snapshots().map((snapshot){
      return snapshot.docs 
        .map((doc) => CategoryModel.fromFirestore(doc))
        .toList();
    });
  }

  // @override
  // Stream<List> videosList() {
  //   // TODO: implement videosList
  //   throw UnimplementedError();
  // }

}