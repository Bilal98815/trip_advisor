part of 'models.dart';

class TripModel {
  TripModel({
    this.image,
    this.isTravellersChoice,
    this.name,
    this.rating,
    this.description,
    this.location,
  });

  TripModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] as String;
    isTravellersChoice = json['isTravellersChoice'] as bool;
    name = json['name'] as String;
    rating = json['rating'] as double;
    description = json['description'] as String;
    location = json['location'] as String;
  }
  String? image;
  bool? isTravellersChoice;
  String? name;
  double? rating;
  String? description;
  String? location;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['isTravellersChoice'] = isTravellersChoice;
    data['name'] = name;
    data['rating'] = rating;
    data['description'] = description;
    data['location'] = location;
    return data;
  }
}
