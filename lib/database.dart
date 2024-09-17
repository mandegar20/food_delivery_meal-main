import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference galleryCollection =
      FirebaseFirestore.instance.collection('gallery');

  Future<void> saveUserInfo(String userId, String name, String address,
      String phoneNumber, String email) async {
    try {
      // Create a reference to the user's document in Firestore
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      // Create a map with the user information
      Map<String, dynamic> userInfo = {
        'name': name,
        'address': address,
        'phoneNumber': phoneNumber,
        'email': email,
      };

      // Save the user information to Firestore
      await userRef.set(userInfo);
    } catch (e) {
      // Handle any errors that occur during the saving process
      print('Error saving user information: $e');
    }
  }
}
