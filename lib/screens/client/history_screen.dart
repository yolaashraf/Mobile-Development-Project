import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/auth_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/historydata.dart';
import '../../widgets/history_row_widget.dart';
import '../../services/book_services.dart';
import '../../model/book.dart';

class History extends ConsumerWidget {
  Widget myWidgets(allUserBooking, index) {
    return Column(
      children: [
        SizedBox(height: 20),
        HistoryRow(
            TripName: allUserBooking[index].tripName,
            price: allUserBooking[index].price,
            location: allUserBooking[index].location,
            sDate: allUserBooking[index].startDate,
            eDate: allUserBooking[index].endDate,
            state: '${data().historyData[0][5]}')
      ],
    );
  }

  History({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String currentuserid = ref.watch(curentUserProvider).value!.userid;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: StreamBuilder<List<Book>>(
        stream: Book_Service().readUserBooking(),
        builder: (context, snapshot) {
          print(Book_Service().readUserBooking());
          if (snapshot.hasData) {
            final allUserBooking = snapshot.data!;
            return ListView.builder(
                itemCount: allUserBooking.length,
                itemBuilder: (context, index) {
                  if (currentuserid == allUserBooking[index].userId) {
                    return myWidgets(allUserBooking, index);
                  } else if ((currentuserid != allUserBooking[index].userId)) {
                    return Container();
                  } else {
                    return Center(child: Text('No History yet !'));
                  }
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      appBar: AppBar(title: Text('History')),
    );
  }
}
