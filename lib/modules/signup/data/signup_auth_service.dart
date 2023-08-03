import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../common/models/user_model.dart';

class SignupAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    UserModel user = UserModel(
      email: email,
      name: '',
    );
    await addUserDetails(user);
  }

  Future addUserDetails(UserModel user) async {
    // // creating an empty collection
    // CollectionReference collectionReference = FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(user.email)
    //     .collection('photos');
    // collectionReference.doc();

    Timestamp time = Timestamp.fromDate(DateTime.now());
    await FirebaseFirestore.instance.collection('users').doc(user.email).set({
      'email': user.email,
      'country': '',
      'name': '',
      'location': const GeoPoint(0, 0),
      'fcm': '',
      'time': time,
      'photos': [],
      'bio': '',
      'website': '',
    });
  }
}
