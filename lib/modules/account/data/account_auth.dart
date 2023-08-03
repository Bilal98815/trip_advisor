import 'package:firebase_auth/firebase_auth.dart';

class AccountAuth {
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
