import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/trip.dart';

class Trip_Service {
  void AddTrip({
    required description,
    required endDate,
    required img,
    required location,
    required price,
    required startDate,
    required tripName,
  }) async {
    final docUser = FirebaseFirestore.instance.collection(('trips')).doc();
    final user = Trip(
      description: description,
      endDate: endDate,
      img: img,
      location: location,
      price: price,
      startDate: startDate,
      tripName: tripName,
      tripid: docUser.id,
      latlng: GeoPoint(28.5625057,33.9408635)
    );
    final json = user.toJson();
    await docUser.set(json);
  }

  // void UpdateFav({required fav,required }) async {
  //   final docUser = FirebaseFirestore.instance.collection(('trips')).doc();
  //   await docUser.update({"fav": fav});
  // }

  Stream<List<Trip>> viewTrips() {
    return FirebaseFirestore.instance.collection('trips').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Trip.fromJson(doc.data())).toList());
  }

  // Stream<List<Trip>> viewTripData(String data,id) {
  //   // print(FirebaseFirestore.instance
  //   //     .collection('fav')
  //   //     // .where("userId", isEqualTo: userId)
  //   //     .snapshots()
  //   //     .forEach((element) {
  //   //   print(element.docs.map((e) => e.data()));
  //   // }));
  //   return FirebaseFirestore.instance
  //       .collection('trips')
  //       .where(data, isEqualTo: data)
  //       .snapshots()
  //       .map((snapshot) =>
  //           snapshot.docs.map((doc) => Trip.fromJson(doc.data())).toList());
  // }
}
