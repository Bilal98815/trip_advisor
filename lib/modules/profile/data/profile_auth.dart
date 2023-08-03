import 'package:firebase_auth/firebase_auth.dart';

class ProfileAuth {
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
