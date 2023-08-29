import 'package:flutter/material.dart';

part 'asset_provider.dart';

abstract class Assets {
  String get baseDirectory;

  String get owlLogo => '$baseDirectory/owl.png';

  String get gmailIcon => '$baseDirectory/google.png';
  String get emailIcon => '$baseDirectory/email.png';

  String get coloredLocationPicture => '$baseDirectory/location.png';
  String get coloredPersonPicture => '$baseDirectory/man.png';

  String get saveTripsIcon => '$baseDirectory/heart.png';
  String get seeSavedTripsIcon => '$baseDirectory/placeholder.png';
  String get trackTripsIcon => '$baseDirectory/document.png';
  String get shareTripsIcon => '$baseDirectory/follow.png';

  String get bookingsIcon => '$baseDirectory/invoice.png';
  String get invoiceIcon => '$baseDirectory/invoice2.png';
  String get profileIcon => '$baseDirectory/user.png';
  String get messagesIcon => '$baseDirectory/mail.png';
  String get preferencesIcon => '$baseDirectory/settings.png';
  String get supportIcon => '$baseDirectory/question.png';
  String get tripAdvisorIcon => '$baseDirectory/owl_icon.png';

  String get defaultProfilePic => '$baseDirectory/mine.jpg';

  String get profileCityIcon => '$baseDirectory/profile_placeholder.png';
  String get profileWebsiteIcon => '$baseDirectory/link.png';

  String get speedDialPlaceIcon => '$baseDirectory/pin_black.png';
  String get speedDialReviewIcon => '$baseDirectory/pen.png';
  String get speedDialPhotoIcon => '$baseDirectory/gallery.png';

  String get reviewBackgroundImage => '$baseDirectory/stone_monument.jpg';

  String get missingPlaceIcon => '$baseDirectory/pin.png';

  String get bedIcon => '$baseDirectory/bed.png';
  String get dinnerIcon => '$baseDirectory/cutlery.png';
  String get halfCircleIcon => '$baseDirectory/half_circle.png';
  String get londonPicture => '$baseDirectory/london.jpg';
  String get forestRoadPicture => '$baseDirectory/forest_road.jpg';
  String get forumsIcon => '$baseDirectory/forums.png';
  String get trip1Picture => '$baseDirectory/trip1.jpg';
  String get trip2Picture => '$baseDirectory/trip2.jpg';
}

class DarkThemeAssets extends Assets {
  @override
  String get baseDirectory => 'assets/images/dark';
}

class LightThemeAssets extends Assets {
  @override
  String get baseDirectory => 'assets/images/light';
}
