import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screens/client/favorites_screen.dart';
import '../model/fav_model.dart';

class Fav_Service {
  void AddFav(
      {required tripId,
      required userId,
      required tripImg,
      required tripName,
      required tripdescription,
      required price,
      required triplocation,
      required sDate,
      required eDate}) async {
    final docUser = FirebaseFirestore.instance.collection(('fav')).doc();
    final user = FavModel(
        eDate: eDate,
        price: price,
        sDate: sDate,
        tripdescription: tripdescription,
        triplocation: triplocation,
        favId: docUser.id,
        tripId: tripId,
        userId: userId,
        tripImg: tripImg,
        tripName: tripName);
    final json = user.toJson();
    await docUser.set(json);
  }

  Stream<List<FavModel>> viewAllFav(String userId) {
    // print(FirebaseFirestore.instance
    //     .collection('fav')
    //     // .where("userId", isEqualTo: userId)
    //     .snapshots()
    //     .forEach((element) {
    //   print(element.docs.map((e) => e.data()));
    // }));
    return FirebaseFirestore.instance
        .collection('fav')
        .where("userId", isEqualTo: userId)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => FavModel.fromJson(doc.data())).toList());
  }

  Future<void> removeFav(String favId) async {
    await FirebaseFirestore.instance.collection('fav').doc(favId).delete();
  }
}
