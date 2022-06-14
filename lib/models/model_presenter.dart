import 'package:cloud_firestore/cloud_firestore.dart';  

class PresenterModel {
  String? documentId;
  String? firstname;
  String? lastname;
  String? profile;
  String? image;
  String? introVideo;
  String? gender;
  String? phone; 
  String? email; 
  String? website;
  // List<FavouriteModel> favourites;
  List<String>? favourites;
  bool? status;

  PresenterModel({
    this.documentId,
    this.firstname,
    this.lastname,
    this.profile,
    this.image,
    this.introVideo,
    this.gender,
    this.phone, 
    this.email,
    this.website,
    this.favourites,
    // this.dateJoined,
    this.status = true,
  });
  
  static List<String>? _setFavourites(favourites) {
    if (favourites != null) {
      final Iterable refactorFavourites = favourites;
      return refactorFavourites.map((item) {
        return item;
      }).toList() as List<String>?;
    }
    return null;
  }
 
   
  static PresenterModel? fromMap(Map<String, dynamic>? map, String uid) {
    if (map == null) return null; 
    
    return PresenterModel(
      documentId: map['documentId'] as String? ?? "",
      firstname: map['firstname'] as String? ?? "",
      lastname: map['lastname'] as String? ?? "",
      profile: map['profile'] as String? ?? "",
      image: map['image'] as String? ?? "",
      introVideo: map['introVideo'] as String? ?? "",
      gender: map['gender'] as String? ?? "",
      phone: map['phone'] as String? ?? "", 
      email: map['email'] as String? ?? "",
      website: map['website'] as String? ?? "",
      favourites: _setFavourites(map['favourites']) ?? [], 
      // dateJoined: map['dateJoined'] as Timestamp?,
      status: map['status'] as bool? ?? true,
    );
  }

  factory PresenterModel.fromJson(Map<String, dynamic> json) {
    return PresenterModel(
      documentId: json['documentId'] as String? ?? '',
      firstname: json['firstname'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
      profile: json['profile'] as String? ?? '',
      image: json['image'] as String? ?? '',
      introVideo: json['introVideo'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      phone: json['phone'] as String? ?? '', 
      email: json['email'] as String? ?? '', 
      website: json['website'] as String? ?? '', 
      favourites: _setFavourites(json['favourites']) ?? [], 
      // dateJoined: json['dateJoined'] as Timestamp?,
      status: json['status'] as bool? ?? true,
    );
  }

  factory PresenterModel.fromFirestore(DocumentSnapshot snapshot) {
    // var document = snapshot.data();
    Map document = snapshot.data() as Map;

    return PresenterModel( 
      documentId: document['documentId'] as String? ?? '',
      firstname: document['firstname'] as String? ?? '',
      lastname: document['lastname'] as String? ?? '',
      profile: document['profile'] as String? ?? '',
      image: document['image'] as String? ?? '',
      introVideo: document['introVideo'] as String? ?? '',
      gender: document['gender'] as String? ?? '',
      phone: document['phone'] as String? ?? '', 
      email: document['email'] as String? ?? '',
      website: document['website'] as String? ?? '',
      favourites: _setFavourites(document['favourites']) ?? <String>[], 
      // dateJoined: document['dateJoined'] as Timestamp,
      status: document['status'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'documentId': documentId,
      'firstname': firstname,
      'lastname': lastname,
      'profile': profile,
      'image': image,
      'introVideo': introVideo,
      'gender': gender,
      'phone': phone, 
      'email': email,
      'favourites': favourites, 
      // 'dateJoined': dateJoined, 
      'status': status,
    };
  }
}
