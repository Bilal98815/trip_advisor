import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

class Preferences {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  void setEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
  }

  Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  void removeEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
  }

  void setUserDetails(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = await getFCMToken();
    prefs.setString('email', email);
    prefs.setString('fcm', token!);
  }

  Future<UserModel> getSharedPreferenceUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? name = prefs.getString('name');
    String? email = prefs.getString('email');
    String? fcm = prefs.getString('fcm');

    UserModel user = UserModel();

    user.name = name;
    user.email = email;
    user.fcm = fcm;

    return user;
  }

  Future<String?> getFCMToken() async {
    // NotificationSettings settings = await _messaging.requestPermission();
    String? token = await _messaging.getToken();
    return token;
  }
}
