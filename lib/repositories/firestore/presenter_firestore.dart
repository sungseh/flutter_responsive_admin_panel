import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';

import '../abstract/abstract_repo.dart';  

class PresenterFirestore implements PresenterRepo {
  final presenterCollection = FirebaseFirestore.instance.collection('teachers');
  // late final AudiosServices services;


  @override
  Stream<List<PresenterModel>> presenters() {
    return presenterCollection
      .limit(10)
      .snapshots()
      .map((snapshot) {
      return snapshot.docs
        .map((doc) => PresenterModel.fromFirestore(doc))
        .toList();
    });
  }
  
  @override
  Stream<List<PresenterModel>>? presentersList() {
    QuerySnapshot data;
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

  // @override
  // Future<List<AudioModel>> fetchPosts(int page) async {
  //   final posts = await services.fetchPosts(page);
  //   return posts.map((e) => AudioModel.fromJson(e)).toList();
  // } 
}
 
  