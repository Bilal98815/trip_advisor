part of 'data.dart';

class AccountAuth {
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
