import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/book.dart';

class Book_Service {
  void bookNow(
      {required tripName,
      required price,
      required peopleCount,
      required location,
      required description,
      required userId,
      required tripId,
      required startDate,
      required endDate}) async {
    final docUser = FirebaseFirestore.instance.collection(('book')).doc();
    final user = Book(
        description: description,
        location: location,
        peopleCount: peopleCount,
        price: price,
        tripName: tripName,
        tripId: tripId,
        userId: userId,
        bookId: docUser.id,
        endDate: endDate,
        startDate: startDate);
    final json = user.toJson();
    await docUser.set(json);
  }

  Stream<List<Book>> readUserBooking() {
    return FirebaseFirestore.instance.collection('book').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((doc) => Book.fromJson(doc.data())).toList());
  }
}
