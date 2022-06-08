import 'package:flutter_responsive_admin_panel/models/models.dart';

abstract class UserRepo { 
  Future<UserModel?> getUser(String uid);
  Future<String> createUser(UserModel user);
  Future<bool> validateToken();
  Future<bool> saveUser({required UserModel user});
  Future<UserModel?> loadUser();
  Future<bool> deleteUser(); 
}