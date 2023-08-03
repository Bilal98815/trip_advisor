import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? email;
  String? name;
  String? country;
  GeoPoint? location;

  UserModel({this.email, required name});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    country = json['country'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['country'] = this.country;
    data['location'] = this.location;
    return data;
  }
}
