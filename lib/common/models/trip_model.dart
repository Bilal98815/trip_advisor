part of 'models.dart';

//ignore: must_be_immutable
class TripModel extends Equatable {
  TripModel({
    this.image,
    this.isTravellersChoice,
    this.isAward,
    this.name,
    this.rating,
    this.description,
    this.location,
    this.isFavourite,
  });

  TripModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] as String;
    isTravellersChoice = json['isTravellersChoice'] as int;
    isAward = json['isAward'] as int;
    name = json['name'] as String;
    rating = json['rating'] as double;
    description = json['description'] as String;
    location = json['location'] as String;
    isFavourite = json['isFavourite'] as bool;
  }

  String? image;
  int? isTravellersChoice;
  int? isAward;
  String? name;
  double? rating;
  String? description;
  String? location;
  bool? isFavourite;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['isTravellersChoice'] = isTravellersChoice;
    data['isAward'] = isAward;
    data['name'] = name;
    data['rating'] = rating;
    data['description'] = description;
    data['location'] = location;
    data['isFavourite'] = isFavourite;
    return data;
  }

  @override
  List<Object?> get props => [
        image,
        name,
        description,
        location,
        isFavourite,
        isAward,
        isTravellersChoice,
        rating,
      ];
}
