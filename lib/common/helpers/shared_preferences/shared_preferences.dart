import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_advisor/common/models/user_model.dart';

class Preferences {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> setEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
  }

  Future<String?> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  Future<void> removeEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
  }

  Future<void> setUserDetails(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = await getFCMToken();
    prefs.setString('email', email);
    prefs.setString('fcm', token!);
  }

  Future<UserModel> getSharedPreferenceUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? name = prefs.getString('name');
    final String? email = prefs.getString('email');
    final String? fcm = prefs.getString('fcm');

    final UserModel user = UserModel();

    user.name = name;
    user.email = email;
    user.fcm = fcm;

    return user;
  }

  Future<String?> getFCMToken() async {
    // NotificationSettings settings = await _messaging.requestPermission();
    final String? token = await _messaging.getToken();
    return token;
  }

  Future<void> clearPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.clear();
  }
}
