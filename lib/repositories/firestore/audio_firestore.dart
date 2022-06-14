import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';

import '../abstract/abstract_repo.dart';  

class AudioFirestore implements AudioRepo {
  final audioCollection = FirebaseFirestore.instance.collection('audios');
  // late final AudiosServices services;

  // @override
  // Future<List<AudioModel>> fetchPosts(int page) async {
  //   final posts = await services.fetchPosts(page);
  //   return posts.map((e) => AudioModel.fromJson(e)).toList();
  // }

  @override
  Stream<List<AudioModel>> audios() {
    return audioCollection.snapshots().map((snapshot) {
      return snapshot.docs
        .map((doc) => AudioModel.fromFirestore(doc))
        .toList();

        // .map((doc) => AudioModel.fromEntity(AudioEntity.fromSnapshot(doc))).toList();
    });
  } 

  @override 
  Stream<List<AudioModel>>? audiosByCategory(CategoryModel category){
    if(category.name != null){
      return audioCollection
        .where('category', isEqualTo: category.name)
        .limit(10)
        .snapshots().map((snapshot){
          return snapshot.docs
            // .map((doc) => AudioModel.fromEntity(AudioEntity.fromSnapshot(doc)))
            .map((doc) => AudioModel.fromFirestore(doc))
            .toList();
        });
    } else {
      return null;
    }
  }

  
 
}
 
  