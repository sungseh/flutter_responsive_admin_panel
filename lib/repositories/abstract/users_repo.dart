
import 'package:flutter_responsive_admin_panel/models/models.dart';

abstract class UsersRepo {
  Stream<List<UserModel>> users();
  Stream<List<UserModel>>? usersList();
  // Future<List<UserModel>> fetchPosts(int page); 
  Stream<List<UserModel>>? usersByCategory(CategoryModel category);
}
