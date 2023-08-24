part of 'models.dart';

class UserModel {
  UserModel({
    this.email,
    this.name,
    this.fcm,
    this.location,
    this.country,
    this.photos,
    this.website,
    this.imageUrl,
    this.bio,
    this.time,
    this.locale,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'] as String;
    name = json['name'] as String;
    fcm = json['fcm'] as String;
    country = json['country'] as String;
    location = json['location'] as GeoPoint;
    bio = json['bio'] as String;
    time = json['time'] as Timestamp;
    website = json['website'] as String;
    imageUrl = json['imageUrl'] as String;
    photos = json['photos'] as List<dynamic>? ?? [];
    locale = json['locale'] != null
        ? Locale.fromSubtags(
            languageCode: (json['locale'] as String).split('-')[0],
            countryCode: (json['locale'] as String).split('-')[1],
          )
        : kStartingLocale;
  }
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
  Locale? locale;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['fcm'] = fcm;
    data['time'] = time;
    data['country'] = country;
    data['photos'] = photos;
    data['bio'] = bio;
    data['imageUrl'] = imageUrl;
    data['website'] = website;
    data['location'] = location;
    data['locale'] = locale?.toLanguageTag();
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
    Locale? locale,
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
      website: website ?? this.website,
      locale: locale ?? this.locale,
    );
  }
}
