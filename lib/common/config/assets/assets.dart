import 'package:flutter/material.dart';

class Assets extends InheritedWidget {
  const Assets({super.key, required this.child}) : super(child: child);

  @override
  final Widget child;

  static BuildContext? buildcontext;

  static Assets of(BuildContext context) {
    buildcontext = context;
    return context.dependOnInheritedWidgetOfExactType<Assets>()!;
  }

  String _getImagePath(String imageName) {
    final Brightness brightness = Theme.of(buildcontext!).brightness;
    final themeModeFolder = brightness == Brightness.light ? 'light' : 'dark';
    return 'assets/images/$themeModeFolder/$imageName';
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  String get owlLogo => _getImagePath('owl.png');

  String get gmailIcon => _getImagePath('google.png');
  String get emailIcon => _getImagePath('email.png');

  String get coloredLocationPicture => _getImagePath('location.png');
  String get coloredPersonPicture => _getImagePath('man.png');

  String get saveTripsIcon => _getImagePath('heart.png');
  String get seeSavedTripsIcon => _getImagePath('placeholder.png');
  String get trackTripsIcon => _getImagePath('document.png');
  String get shareTripsIcon => _getImagePath('follow.png');

  String get bookingsIcon => _getImagePath('invoice.png');
  String get profileIcon => _getImagePath('user.png');
  String get messagesIcon => _getImagePath('mail.png');
  String get preferencesIcon => _getImagePath('settings.png');
  String get supportIcon => _getImagePath('question.png');
  String get tripAdvisorIcon => _getImagePath('owl_icon.png');

  String get defaultProfilePic => _getImagePath('mine.jpg');

  String get profileCityIcon => _getImagePath('profile_placeholder.png');
  String get profileWebsiteIcon => _getImagePath('link.png');

  String get speedDialPlaceIcon => _getImagePath('pin_black.png');
  String get speedDialReviewIcon => _getImagePath('pen.png');
  String get speedDialPhotoIcon => _getImagePath('gallery.png');

  String get reviewBackgroundImage => _getImagePath('stone_monument.jpg');

  String get missingPlaceIcon => _getImagePath('pin.png');
}
