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
    return audioCollection
      .limit(10)
      .snapshots()
      .map((snapshot) {
      return snapshot.docs
        .map((doc) => AudioModel.fromFirestore(doc))
        .toList();

        // .map((doc) => AudioModel.fromEntity(AudioEntity.fromSnapshot(doc))).toList();
    });
  } 

  @override
  Stream<List<AudioModel>>? audiosList() {
    // QuerySnapshot data;
    // if (_lastVisible == null) {
    //   data = await audioCollection
    //     .orderBy(_orderBy, descending: _descending)
    //     .limit(10)
    //     .get();

    //   //ORIGINAL
    //   // data = await firestore
    //   //   .collection(collectionName)
    //   //   .orderBy(_orderBy, descending: _descending)
    //   //   .limit(10)
    //   //   .get();
    // } else {
    //    data = await audioCollection
    //     .orderBy(_orderBy, descending: _descending)
    //     .startAfter([_lastVisible![_orderBy]])
    //     .limit(10)
    //     .get();

    //   //ORIGINAL 
    //   // data = await firestore
    //   //   .collection(collectionName)
    //   //   .orderBy(_orderBy, descending: _descending)
    //   //   .startAfter([_lastVisible![_orderBy]])
    //   //   .limit(10)
    //   //   .get();
    // }

    // // if (data.docs.length > 0) {
    // if (data.docs.isNotEmpty) {
    //   _lastVisible = data.docs[data.docs.length - 1];
    //   if (mounted) {
    //     setState(() {
    //       _isLoading = false;
    //       _hasData = true;
    //       _snap.addAll(data.docs);
    //       _data = _snap.map((e) => VideoModel.fromFirestore(e)).toList();
    //     });
    //   }
    // } else {
    //   if(_lastVisible == null){
    //     setState(() {
    //       _isLoading = false;
    //       _hasData = false; 
    //     });
    //   }else{
    //     setState(() {
    //       _isLoading = false;
    //       _hasData = true;
    //     });
    //     openToast(context, 'No more content available');
    //   }
    // }
    // return;
    return null;
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
 
  