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

  static String get accountSigninInfo1 => 'account.signin_box.info1'.tr();
  static String get accountSigninInfo2 => 'account.signin_box.info2'.tr();
  static String get accountSigninButton => 'account.signin_box.button'.tr();

  static String get signoutDialogText => 'account.signout_dialog.message'.tr();
  static String get signoutDialogButton => 'account.signout_dialog.button'.tr();

  static String get version => 'account.version'.tr();
  static String get deviceId => 'account.device_id'.tr();

  //bottom bar
  static String get exploreTab => 'bottom_bar_tabs.explore'.tr();
  static String get searchTab => 'bottom_bar_tabs.search'.tr();
  static String get planTab => 'bottom_bar_tabs.plan'.tr();
  static String get reviewTab => 'bottom_bar_tabs.review'.tr();
  static String get accountTab => 'bottom_bar_tabs.account'.tr();

  //edit profile
  static String get editProfileTitle => 'edit_profile.title'.tr();
  static String get editProfileSaveButton => 'edit_profile.save_button'.tr();

  static String get editProfileError => 'edit_profile.error'.tr();

  static String get nameLabel => 'edit_profile.name_textfield_label'.tr();
  static String get cityLabel => 'edit_profile.city_textfield_label'.tr();
  static String get websiteLabel => 'edit_profile.website_textfield_label'.tr();
  static String get aboutLabel => 'edit_profile.about_textfield_label'.tr();

  static String get nameHint => 'edit_profile.name_textfield_hint'.tr();
  static String get websiteHint => 'edit_profile.website_textfield_hint'.tr();
  static String get aboutHint => 'edit_profile.about_textfield_hint'.tr();

  //explore
  static String get exploreTitle => 'explore.title'.tr();
}
