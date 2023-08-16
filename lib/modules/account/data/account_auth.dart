part of 'data.dart';

class AccountAuth {
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
