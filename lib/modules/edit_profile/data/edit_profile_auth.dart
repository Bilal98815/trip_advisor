import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import '../../../common/models/user_model.dart';

class EditProfileAuth {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future updateUser(String bio, String name, String website, String email,
      Uint8List file) async {
    Map<String, dynamic> data = {};

    final snapShot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    final userDoc = snapShot.docs.first;
    final userData = userDoc.data();

    final user = UserModel.fromJson(userData);

    String imageUrl = user.imageUrl!;

    if (file.isNotEmpty) {
      debugPrint('------------->>>>> File is not Empty');
      imageUrl = await uploadImageToStorage(
          'profilePictures-${DateTime.now().millisecondsSinceEpoch}', file);
    }

    if (bio.isNotEmpty) {
      data['bio'] = bio;
    }
    if (name.isNotEmpty) {
      data['name'] = name;
    }

    if (website.isNotEmpty) {
      data['website'] = website;
    }

    if (data.isNotEmpty) {
      data['imageUrl'] = imageUrl;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(email)
          .update(data);
    }
  }

  Future updateCountry(String country, String email) async {
    await FirebaseFirestore.instance.collection('users').doc(email).update({
      'country': country,
    });
  }

  Future uploadImageToStorage(String childName, Uint8List file) async {
    final ref = _firebaseStorage.ref(childName);
    UploadTask task = ref.putData(file);
    TaskSnapshot snapshot = await task;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
