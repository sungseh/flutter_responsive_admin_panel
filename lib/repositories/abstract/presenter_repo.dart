
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';

abstract class PresenterRepo {
  Future<List<PresenterModel>?> infiniteScroll({DocumentSnapshot? start, required int limit});
  Future<List<PresenterModel>?> infiniteScroll2({DocumentSnapshot? start, required int limit, required bool mounted});
  Stream<List<PresenterModel>> presenters();
  Stream<List<PresenterModel>>? presentersList();
  // Future<List<AudioModel>> fetchPosts(int page); 
}
