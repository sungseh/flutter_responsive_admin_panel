import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  // Stream<List<CategoryModel>> categories();  
  // Stream<List<QuerySnapshot>> getCategory(String name);
  Future<void> signUp({required String email, required String password});
  Future<UserCredential?> signIn({required String email, required String password});
  Future<void> signInWithGoogle();
  Future<void> signOut();
}
