part of 'data.dart';

class EditProfileAuth {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future updateUser({
    String? bio,
    String? name,
    String? website,
    String? email,
    Uint8List? file,
  }) async {
    Map<String, dynamic> data = {};

    final snapShot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    final userDoc = snapShot.docs.first;
    final userData = userDoc.data();

    final user = UserModel.fromJson(userData);

    String imageUrl = user.imageUrl ?? '';

    if (file != null) {
      debugPrint('------------->>>>> File is not Empty');
      imageUrl = await uploadImageToStorage(
        'profilePictures-${DateTime.now().millisecondsSinceEpoch}',
        file,
      ).toString();
    }

    final updatedUser = user.copyWith(
      bio: bio,
      name: name,
      website: website,
      imageUrl: imageUrl,
    );

    data = updatedUser.toJson();

    if (data.isNotEmpty) {
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
    final UploadTask task = ref.putData(file);
    final TaskSnapshot snapshot = await task;
    final String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
