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

  static String get editProfileNameLabel =>
      'edit_profile.name_textfield_label'.tr();
  static String get editProfileCityLabel =>
      'edit_profile.city_textfield_label'.tr();
  static String get editProfileWebsiteLabel =>
      'edit_profile.website_textfield_label'.tr();
  static String get editProfileAboutLabel =>
      'edit_profile.about_textfield_label'.tr();

  static String get editProfileNameHint =>
      'edit_profile.name_textfield_hint'.tr();
  static String get editProfileWebsiteHint =>
      'edit_profile.website_textfield_hint'.tr();
  static String get editProfileAboutHint =>
      'edit_profile.about_textfield_hint'.tr();

  //explore
  static String get exploreTitle => 'explore.title'.tr();

  //forgot password
  static String get forgotPasswordHeading => 'forgot_password.heading'.tr();

  static String get forgotPasswordEmailLabel =>
      'forgot_password.email_textfield_label'.tr();
  static String get forgotPasswordEmailHint =>
      'forgot_password.email_textfield_hint'.tr();
  static String get forgotPasswordEmailError =>
      'forgot_password.email_textfield_error'.tr();

  static String get forgotPasswordButton => 'forgot_password.button'.tr();
  static String get forgotPasswordInformation =>
      'forgot_password.information'.tr();
  static String get forgotPasswordError => 'forgot_password.error'.tr();

  static String get forgotPasswordDialogTitle =>
      'forgot_password.dialog.title'.tr();
  static String get forgotPasswordDialogText =>
      'forgot_password.dialog.text'.tr();
  static String get forgotPasswordDialogBackButton =>
      'forgot_password.dialog.back_button'.tr();
  static String get forgotPasswordDialogResendButton =>
      'forgot_password.dialog.resend_button'.tr();

  //location data
  static String get locationDataHeading => 'location_data.heading'.tr();
  static String get locationDataAllow => 'location_data.allow'.tr();
  static String get locationDataNotNow => 'location_data.not_now'.tr();

  //login
  static String get loginHeading => 'login.heading'.tr();

  static String get loginEmailLabel => 'login.email_textfield_label'.tr();
  static String get loginEmailHint => 'login.email_textfield_hint'.tr();
  static String get loginEmailError => 'login.email_textfield_error'.tr();

  static String get loginPasswordLabel => 'login.password_textfield_label'.tr();
  static String get loginPasswordHint => 'login.password_textfield_hint'.tr();
  static String get loginPasswordEmptyError =>
      'login.password_textfield_empty_error'.tr();
  static String get loginPasswordLengthError =>
      'login.password_textfield_length_error'.tr();

  static String get loginForgotPassword => 'login.forgot_password'.tr();
  static String get loginSigninButton => 'login.signin_button'.tr();
  static String get loginSignupButton => 'login.signup_button'.tr();

  static String get loginError => 'login.error'.tr();

  static String get loginExceptionSomethingWrong =>
      'login.exceptions.something_wrong'.tr();
  static String get loginExceptionNetwork => 'login.exceptions.network'.tr();
  static String get loginExceptionEmpty => 'login.exceptions.empty'.tr();
  static String get loginExceptionCredentials =>
      'login.exceptions.credentials'.tr();
  static String get loginExceptionInvalidEmail =>
      'login.exceptions.invalid_email'.tr();
  static String get loginExceptionWrongPassword =>
      'login.exceptions.wrong_password'.tr();
  static String get loginExceptionNoUser =>
      'login.exceptions.user_not_found'.tr();
  static String get loginExceptionDisabledUser =>
      'login.exceptions.user_disabled'.tr();
  static String get loginExceptionEmailExists =>
      'login.exceptions.email_exists'.tr();
  static String get loginExceptionWeakPassword =>
      'login.exceptions.weak_password'.tr();

  //onboarding
  static String get onboardingSkip => 'onboarding.skip'.tr();
  static String get onboardingHeading => 'onboarding.heading'.tr();

  static String get onboardingTextLine1 => 'onboarding.text.line1'.tr();
  static String get onboardingTextTerms => 'onboarding.text.terms'.tr();
  static String get onboardingTextLine2 => 'onboarding.text.line2'.tr();
  static String get onboardingTextPrivacy => 'onboarding.text.privacy'.tr();

  static String get onboardingGoogleButton => 'onboarding.google_button'.tr();
  static String get onboardingEmailButton => 'onboarding.email_button'.tr();
}
