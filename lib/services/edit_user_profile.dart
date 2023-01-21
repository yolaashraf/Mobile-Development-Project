import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfile {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
 editMyProfile({id, newMail, newPassword, newUsername,type}) {
    print('Edit started');
    firebaseFirestore
        .collection("users")
        .doc(id)
        .set({'email': newMail, 'password': newPassword, 'name': newUsername,'type' : type,'userid':id});
  }
}
