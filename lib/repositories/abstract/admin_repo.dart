import 'package:flutter_responsive_admin_panel/models/models.dart';

abstract class AdminRepo {
  Stream<List<AudioModel>> audiosList();
  // Stream<List<VideoModel>> videosList();
  Stream<List<CategoryModel>> categoriesList(); 
  
}