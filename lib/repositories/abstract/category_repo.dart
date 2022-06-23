
import 'package:flutter_responsive_admin_panel/models/models.dart';

abstract class CategoryRepo {
  Stream<List<CategoryModel>> categories();
  Stream<List<CategoryModel>>? categoriesList();
  // Future<List<AudioModel>> fetchPosts(int page); 
}
