import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/repositories/abstract/video_repo.dart';
 

class VideoFirestore implements VideoRepo {
  final videoCollection = FirebaseFirestore.instance.collection('videos');
  // late final VideosServices services;

  // @override
  // Future<List<VideoModel>> fetchPosts(int page) async {
  //   final posts = await services.fetchPosts(page);
  //   return posts.map((e) => VideoModel.fromJson(e)).toList();
  // }

  @override
  Stream<List<VideoModel>> videos() {
    return videoCollection
      .limit(10)
      .snapshots()
      .map((snapshot) {
      return snapshot.docs
        .map((doc) => VideoModel.fromFirestore(doc))
        .toList();

        // .map((doc) => VideoModel.fromEntity(VideoEntity.fromSnapshot(doc))).toList();
    });
  } 

  @override
  Stream<List<VideoModel>>? videosList() {
    QuerySnapshot data;
    // if (_lastVisible == null) {
    //   data = await videoCollection
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
    //    data = await videoCollection
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
  Stream<List<VideoModel>>? videosByCategory(CategoryModel category){
    if(category.name != null){
      return videoCollection
        .where('category', isEqualTo: category.name)
        .limit(10)
        .snapshots().map((snapshot){
          return snapshot.docs
            // .map((doc) => VideoModel.fromEntity(VideoEntity.fromSnapshot(doc)))
            .map((doc) => VideoModel.fromFirestore(doc))
            .toList();
        });
    } else {
      return null;
    }
  }

  
 
}
 
  