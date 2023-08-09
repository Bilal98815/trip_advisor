import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? email;
  String? name;
  String? country;
  String? fcm;
  GeoPoint? location;
  Timestamp? time;
  String? bio;
  String? imageUrl;
  List<dynamic>? photos;
  String? website;

  UserModel(
      {this.email,
      this.name,
      this.fcm,
      this.location,
      this.country,
      this.photos,
      this.website,
      this.imageUrl,
      this.bio,
      this.time});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    fcm = json['fcm'];
    country = json['country'];
    location = json['location'];
    bio = json['bio'];
    time = json['time'];
    website = json['website'];
    imageUrl = json['imageUrl'];
    photos = json['photos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['fcm'] = this.fcm;
    data['time'] = this.time;
    data['country'] = this.country;
    data['photos'] = this.photos;
    data['bio'] = this.bio;
    data['imageUrl'] = this.imageUrl;
    data['website'] = this.website;
    data['location'] = this.location;
    return data;
  }

  UserModel copyWith({
    String? email,
    String? name,
    String? country,
    String? fcm,
    GeoPoint? location,
    Timestamp? time,
    String? bio,
    String? imageUrl,
    List<dynamic>? photos,
    String? website,
  }) {
    return UserModel(
        email: email ?? this.email,
        name: name ?? this.name,
        country: country ?? this.country,
        fcm: fcm ?? this.fcm,
        location: location ?? this.location,
        time: time ?? this.time,
        bio: bio ?? this.bio,
        imageUrl: imageUrl ?? this.imageUrl,
        photos: photos ?? this.photos,
        website: website ?? this.website);
  }
}
