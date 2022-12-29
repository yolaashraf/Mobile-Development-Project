import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/trip.dart';

class Trip_Service {
  void AddTrip(
      {required description,
      required endDate,
      required img,
      required location,
      required price,
      required startDate,
      required tripName}) async {
    final docUser = FirebaseFirestore.instance.collection(('trips')).doc();
    final user = Trip(
        description: description,
        endDate: endDate,
        img: img,
        location: location,
        price: price,
        startDate: startDate,
        tripName: tripName,
        tripid: docUser.id);
    final json = user.toJson();
    await docUser.set(json);
  }

  Stream<List<Trip>> viewTrips() {
    return FirebaseFirestore.instance.collection('trips').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Trip.fromJson(doc.data())).toList());
  }
}
