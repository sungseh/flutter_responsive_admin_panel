import 'package:cloud_firestore/cloud_firestore.dart';

class SubscriptionModel {
  String? uid;
  String? firstname;
  String? lastname;
  String? displayName;
  String? username;   
  String? phone; 
  String? email; 
  // List<FavouriteModel> favourites;
  // List<String>? favourites; 
  // Timestamp? dateJoined;
  String? status;
  bool? admin;
  String? token;

  SubscriptionModel({
    this.uid,
    this.firstname,
    this.lastname,
    this.displayName,
    this.username, 
    this.phone, 
    this.email, 
    // this.favourites, 
    // this.dateJoined,
    this.status,
    this.admin,
    this.token
  });
  
  // static List<String>? _setFavourites(favourites) {
  //   if (favourites != null) {
  //     final Iterable refactorFavourites = favourites;
  //     return refactorFavourites.map((item) {
  //       return item;
  //     }).toList() as List<String>?; 
  //   }
  //   return null;
  // }
 
  static SubscriptionModel? fromMap(Map<String, dynamic>? map, String uid) {
    if (map == null) return null;

    // List<dynamic> favouritesList = map['favorites']; 

    return SubscriptionModel(
      uid: map['uid'] as String? ?? "Undefined",
      firstname: map['firstname'] as String? ?? "Undefined",
      lastname: map['lastname'] as String? ?? "Undefined",
      displayName: map['displayName'] as String? ?? "Undefined",
      username: map['username'] as String? ?? "Undefined", 
      phone: map['phone'] as String? ?? "Undefined", 
      email: map['email'] as String? ?? "Undefined",
      // favourites: _setFavourites(map['favourites']) ?? [],
      // dateJoined: map['dateJoined'] as Timestamp?,
      status: map['status'] as String? ?? "Active",
      admin: map['admin'] as bool? ?? false,
      token: map['token'] as String? ?? "Undefined",
    );
  }

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      uid: json['uid'] as String? ?? 'Unknown',
      firstname: json['firstname'] as String? ?? 'Unknown',
      lastname: json['lastname'] as String? ?? 'Unknown',
      displayName: json['displayName'] as String? ?? 'Unknown',
      username: json['username'] as String? ?? 'Unknown', 
      phone: json['phone'] as String? ?? 'Unknown', 
      email: json['email'] as String? ?? 'Unknown', 
      // favourites: _setFavourites(json['favourites']) ?? [],
      // dateJoined: json['dateJoined'] as Timestamp?,
      status: json['status'] as String? ?? 'Unknown',
      admin: json['admin'] as bool? ?? false,
      token: json['token'] as String? ?? 'Unknown'
    );
  }

  factory SubscriptionModel.fromFirestore(DocumentSnapshot snapshot) { 
    Map document = snapshot.data() as Map<String, dynamic>; 
    return SubscriptionModel( 
      // uid: document['documentId'] as String? ?? 'Unknown',
      uid: snapshot.id,
      firstname: document['firstname'] as String? ?? 'Unknown',
      lastname: document['lastname'] as String? ?? 'Unknown',
      displayName: document['displayName'] as String? ?? 'Unknown',
      username: document['username'] as String? ?? 'Unknown', 
      phone: document['phone'] as String? ?? 'Unknown', 
      email: document['email'] as String? ?? 'Unknown', 
      // favourites: _setFavourites(json['favourites']) ?? [],
      // dateJoined: document['dateJoined'] as Timestamp?,
      status: document['status'] as String? ?? 'Unknown',
      admin: document['admin'] as bool? ?? false,
      token: document['token'] as String? ?? 'Unknown'
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'firstname': firstname,
      'lastname': lastname,
      'username': username, 
      'phone': phone, 
      'email': email,
      // 'favourites': favourites,
      // 'dateJoined': dateJoined, 
      'status': status,
      'admin': admin,
      'token': token
    };
  }
}
