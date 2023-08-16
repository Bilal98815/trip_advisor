part of 'localization.dart';

class LocaleStrings {
  static const String appTitle = 'Trip Advisor';

  static String get name => 'name'.tr();

  static String urlLauncherError(String url) =>
      'url_launcher_error'.tr(namedArgs: {'url': url});

  //account
  static String get accountTitle => 'account.title'.tr();
  static String get accountSignoutButton => 'account.signout_button'.tr();

  static String get bookingsTile => 'account.profile_tiles.bookings'.tr();
  static String get profileTile => 'account.profile_tiles.profile'.tr();
  static String get messagesTile => 'account.profile_tiles.messages'.tr();
  static String get preferencesTile => 'account.profile_tiles.preferences'.tr();
  static String get supportTile => 'account.profile_tiles.support'.tr();
  static String get tripAdvisorTile => 'account.profile_tiles.tripadvisor'.tr();

  static String get version => 'account.version'.tr();
  static String get deviceId => 'account.device_id'.tr();
}
