part of 'data.dart';

class LocationDataAuth {
  Future<void> updateLocation(String email, GeoPoint location) async {
    await FirebaseFirestore.instance.collection('users').doc(email).update({
      'location': location,
    });
  }
}
