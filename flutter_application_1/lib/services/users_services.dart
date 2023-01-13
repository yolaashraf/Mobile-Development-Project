
   import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user.dart';

class User_Service {
  void creatUser(
      {required name, required email, required password, required type}) async {
    final docUser = FirebaseFirestore.instance.collection(('users')).doc();
    final user = User(
        password: password,
        email: email,
        name: name,
        userid: docUser.id,
        type: type);
    final json = user.toJson();
    await docUser.set(json);
  }

  Stream<List<User>> readUsers() {
    return FirebaseFirestore.instance.collection('users').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
  }
}
