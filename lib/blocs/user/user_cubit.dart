import 'package:bloc/bloc.dart';
import 'package:flutter_responsive_admin_panel/models/models.dart';
import 'package:flutter_responsive_admin_panel/repositories/firestore/user_firestore.dart';

class UserCubit extends Cubit<UserModel?> {
  UserCubit() : super(null);

  ///Event load user
  Future<UserModel?> onLoadUser() async {
    UserModel? user = await UserFirestore.loadUser();
    print("OnLoadUser emitted");
    emit(user);
    return user;
  }

  ///Event fetch user
  Future<UserModel?> onFetchUser() async {
    return await UserFirestore.loadUser(); 
  }

  ///Event save user
  Future<void> onSaveUser(UserModel user) async {
    await UserFirestore.saveUser(user: user);
    emit(user);
  }

  ///Event delete user
  void onDeleteUser() {
    // FirebaseMessaging.instance.deleteToken();
    UserFirestore.deleteUser();
    emit(null);
  }
}
