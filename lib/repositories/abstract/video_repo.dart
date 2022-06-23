
import 'package:flutter_responsive_admin_panel/models/models.dart';

abstract class VideoRepo {
  Stream<List<VideoModel>> videos();
  Stream<List<VideoModel>>? videosList();
  // Future<List<VideoModel>> fetchPosts(int page); 
  Stream<List<VideoModel>>? videosByCategory(CategoryModel category);
}
