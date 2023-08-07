import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataAuth {
  Future updateStatus(String email, String name) async {
    await FirebaseFirestore.instance.collection('users').doc(email).update({
      'name': name,
    });
  }

  Future updateCountry(String email, String country) async {
    await FirebaseFirestore.instance.collection('users').doc(email).update({
      'country': country,
    });
  }
}
