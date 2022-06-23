
import 'package:flutter_responsive_admin_panel/models/models.dart';

abstract class AudioRepo {
  Stream<List<AudioModel>> audios();
  Stream<List<AudioModel>>? audiosList();
  // Future<List<AudioModel>> fetchPosts(int page); 
  Stream<List<AudioModel>>? audiosByCategory(CategoryModel category);
}
