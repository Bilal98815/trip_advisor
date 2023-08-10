import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import 'package:trip_advisor/common/models/user_model.dart';

class ProfileAuth {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<UserModel?> getUserDetails(String email) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final userDoc = querySnapshot.docs.first;
        final userData = userDoc.data();
        debugPrint('Retrieved user data: $userData');

        return UserModel.fromJson(userData);
      } else {
        debugPrint('User not found');
        return null;
      }
    } catch (e) {
      debugPrint('Error retrieving user details: $e');
      return null;
    }
  }

  Future uploadImagesToFireStore(List<Uint8List> images, String email) async {
    final snapShot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    final userDoc = snapShot.docs.first;
    final userData = userDoc.data();
    final user = UserModel.fromJson(userData);

    List<dynamic> imageUrls = user.photos ?? [];

    if (imageUrls.isEmpty) {
      imageUrls = [];
    }

    if (images.isNotEmpty) {
      for (int i = 0; i < images.length; i++) {
        imageUrls.add(await uploadImagesToFirebaseStorage(
            'tripImages-${DateTime.now().millisecondsSinceEpoch}', images[i],),);
      }
    }
    await FirebaseFirestore.instance.collection('users').doc(email).update({
      'photos': imageUrls,
    });
  }

  Future uploadImagesToFirebaseStorage(String childName, Uint8List file) async {
    final ref = _firebaseStorage.ref(childName);
    final UploadTask task = ref.putData(file);
    final TaskSnapshot snapshot = await task;
    final String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
