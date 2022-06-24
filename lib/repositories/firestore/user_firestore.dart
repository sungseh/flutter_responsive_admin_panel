import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';
import 'package:flutter_responsive_admin_panel/models/model_user.dart';
import 'package:flutter_responsive_admin_panel/utils/utils.dart';

class UserFirestore {
  static Future<String> createUser(UserModel user) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    String retVal = "error";
    try {
      await firestore.collection("users").doc(user.uid).set({
        'firstname': user.firstname?.trim(),
        'lastname': user.lastname?.trim(),
        'email': user.email?.trim(),
        'status': "Active",
        'token': user.token?.trim(), 
        'dateJoined': Timestamp.now(),
      });
      retVal = "success";
    } catch (e) {
      log(e.toString());
    }
    return retVal;
  }

  static Future<bool> deleteUser() async {
    return await UtilPreferences.remove(ConfigPreferences.user);
  }

  static Future<UserModel?> getUser(String uid) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {  
      UserModel? user = await firestore.collection('users')
        .doc(uid)
        .get()
        .then((snapshot) => UserModel.fromFirestore(snapshot));
      return user; 
    } catch (e) {
      log(e.toString());
    }
    return null; 
  }


  static Future<UserModel?> loadUser() async {
    final result = UtilPreferences.getString(ConfigPreferences.user);
    if (result != null) {
      return UserModel.fromJson(jsonDecode(result));
    }
    return null;
  }

  static Future<bool> saveUser({required UserModel user}) async {
    return await UtilPreferences.setString(
      ConfigPreferences.user,
      jsonEncode(user.toJson()),
    );
  }

  static Future<bool> validateToken() async {
    // final response = await Api.validateToken(); 
    // if (response.success) {
    //   return true;
    // }
    return false;
  }  
}