import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfileAuth {
  Future updateUser(
      String bio, String name, String website, String email) async {
    await FirebaseFirestore.instance.collection('users').doc(email).update({
      'bio': bio,
      'name': name,
      'website': website,
    });
  }

  Future updateCountry(String country, String email) async {
    await FirebaseFirestore.instance.collection('users').doc(email).update({
      'country': country,
    });
  }
}
