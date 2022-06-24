import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/repositories/abstract/subscriptions_repo.dart';

import '../abstract/abstract_repo.dart';  

class SubscriptionsFirestore implements SubscriptionsRepo {
  final subscriptionCollection = FirebaseFirestore.instance.collection('subscriptions');
  // late final SubscriptionsServices services;

  // @override
  // Future<List<SubscriptionModel>> fetchPosts(int page) async {
  //   final posts = await services.fetchPosts(page);
  //   return posts.map((e) => SubscriptionModel.fromJson(e)).toList();
  // }

  @override
  Stream<List<SubscriptionModel>> subscriptions() {
    return subscriptionCollection
      .limit(10)
      .snapshots()
      .map((snapshot) {
        return snapshot.docs
          .map((doc) => SubscriptionModel.fromFirestore(doc))
          .toList();

          // .map((doc) => SubscriptionModel.fromEntity(SubscriptionEntity.fromSnapshot(doc))).toList();
      });
  } 

  @override
  Stream<List<SubscriptionModel>>? subscriptionsList() {
    // QuerySnapshot data;
    // if (_lastVisible == null) {
    //   data = await subscriptionCollection
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
    //    data = await subscriptionCollection
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
  Stream<List<SubscriptionModel>>? subscriptionsByCategory(CategoryModel category){
    if(category.name != null){
      return subscriptionCollection
        .where('category', isEqualTo: category.name)
        .limit(10)
        .snapshots().map((snapshot){
          return snapshot.docs
            // .map((doc) => SubscriptionModel.fromEntity(SubscriptionEntity.fromSnapshot(doc)))
            .map((doc) => SubscriptionModel.fromFirestore(doc))
            .toList();
        });
    } else {
      return null;
    }
  }

  
 
}
 
  