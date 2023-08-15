import 'package:cloud_firestore/cloud_firestore.dart';

class LocationDataAuth {
  Future<void> updateLocation(String email, GeoPoint location) async {
    await FirebaseFirestore.instance.collection('users').doc(email).update({
      'location': location,
    });
  }
}
