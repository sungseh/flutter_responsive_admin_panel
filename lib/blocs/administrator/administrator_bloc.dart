import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_responsive_admin_panel/misc/misc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdministratorBloc extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? _adminPass;
  String _userType = 'admin';
  bool _isSignedIn = false;
  bool _testing = false;

  final List _states = [];
  final List _categories = [];
  final List _presenters = [];

  List get states => _states;
  List get categories => _categories;
  List get presenters => _presenters;
   
  adminBloc() {
    checkSignIn();
    getAdminPass();
  }
 
  String? get adminPass => _adminPass;
  String get userType => _userType;
  bool get isSignedIn => _isSignedIn;
  bool get testing => _testing;
  bool? _adsEnabled = false;
  bool? get adsEnabled => _adsEnabled;
   
  Future getAdsData () async {
    await firestore.collection('admin').doc('ads').get()
    .then((value){
      if(value.exists){
        _adsEnabled = value['ads_enabled'];
      }else{
        firestore.collection('admin').doc('ads')
        .set({
          'ads_enabled' : false
        });
      }
    });
    log('ads : $_adsEnabled');
    notifyListeners();
  }

  Future controllAds (bool value, context) async {
    await firestore.collection('admin').doc('ads')
    .update({
      'ads_enabled' : value
    });
    _adsEnabled = value;
    if(value == true){
      openToast(context, "Ads enabled successfully");
    }else{
      openToast(context, "Ads disabled successfully");
    }
    notifyListeners();
  }
 
  Future getAdminPass() async{
    firestore.collection('admin')
      .doc('user type')
      .get()
      .then((DocumentSnapshot snap) {
        String? aPass = snap['admin password'];
      _adminPass = aPass;
        notifyListeners();
      });
  }
 
  Future<int> getTotalDocuments (String documentName) async {
    const String fieldName = 'count';
    final DocumentReference ref = firestore.collection('item_count').doc(documentName);
    DocumentSnapshot snap = await ref.get();
    if(snap.exists == true){
      int itemCount = snap[fieldName] ?? 0;
      return itemCount;
    }
    else{
      await ref.set({
        fieldName : 0
      });
      return 0;
    }
  }

  Future increaseCount (String documentName) async {
    await getTotalDocuments(documentName)
      .then((int documentCount) async {
        await firestore.collection('item_count')
        .doc(documentName)
        .update({
          'count' : documentCount + 1
        });
      });
  }

  Future decreaseCount (String documentName) async {
    await getTotalDocuments(documentName)
      .then((int documentCount)async {
        await firestore.collection('item_count')
        .doc(documentName)
        .update({
          'count' : documentCount - 1
        });
      });
  }
 
  Future getCategories() async {
    QuerySnapshot snap = await firestore.collection('categories').get();
    List d = snap.docs;
    _categories.clear();
    for (var element in d) {
      _categories.add(element['name']);
    }
    notifyListeners(); 
  }

  Future getPresenters() async {
    QuerySnapshot snap = await firestore.collection('teachers').get();
    List d = snap.docs;
    _presenters.clear();
    for (var element in d) {
      _presenters.add("${element['firstname']} ${element['lastname']}");
    }
    notifyListeners(); 
  }

  Future getStates() async {
    QuerySnapshot snap = await firestore.collection('states').get();
    List d = snap.docs;
    _states.clear();
    for (var element in d) {
      _states.add(element['name']);
    }
    notifyListeners(); 
  }

 
  Future<List> getFeaturedList ()async{
    final DocumentReference ref = firestore.collection('featured').doc('featured_list');
    DocumentSnapshot snap = await ref.get();
    if(snap.exists == true){
      List featuredList = snap['places'] ?? [];
      if(featuredList.isNotEmpty){
        List<int> a = featuredList.map((e) => int.parse(e)).toList()..sort();
        List<String> b = a.take(10).toList().map((e) => e.toString()).toList();
        return b;
      }else{
        return featuredList;
      }
    }
    else{
      await ref.set({
        'places' : []
      });
      return [];
    }
  }
 
  Future addToFeaturedList (context, String? timestamp) async {
    final DocumentReference ref = firestore.collection('featured').doc('featured_list');
    await getFeaturedList().then((featuredList) async {
      if (featuredList.contains(timestamp)) {
        openToast(context, "This item is already available in the featured list");
      } else {
        featuredList.add(timestamp);
        await ref.update({'places': FieldValue.arrayUnion(featuredList)});
        openToast(context, 'Added Successfully');
      }
    });
  }

  Future removefromFeaturedList (context, String? timestamp) async {
    final DocumentReference ref = firestore.collection('featured').doc('featured_list');
    await getFeaturedList().then((featuredList)async{
      if (featuredList.contains(timestamp)) {
        await ref.update({'places' : FieldValue.arrayRemove([timestamp])});
        openToast(context, 'Removed Successfully');
      } 
    });
  }
 
  Future deleteContent(timestamp, String collectionName) async {
    await firestore.collection(collectionName).doc(timestamp).delete();
    notifyListeners();
  }
 
  Future setSignIn() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('signed_in', true);
    _isSignedIn = true;
    _userType = 'admin';
    notifyListeners();
  }
 
  void checkSignIn() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _isSignedIn = sp.getBool('signed_in') ?? false;
    notifyListeners();
  }
 
  Future setSignInForTesting() async {
    _testing = true;
    _userType = 'tester';
    notifyListeners();
    
  }
 
  Future saveNewAdminPassword (String newPassword) async {
    await firestore.collection('admin')
    .doc('user type')
    .update({
      'admin password' : newPassword
    }).then((value) => getAdminPass());
    notifyListeners();  
  }
}
