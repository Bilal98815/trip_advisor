import 'package:shared_preferences/shared_preferences.dart';

class Preferences{

  void setEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
  }

  Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  void removeEmail()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
  }
}