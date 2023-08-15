import 'package:firebase_auth/firebase_auth.dart';

class AccountAuth {
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
