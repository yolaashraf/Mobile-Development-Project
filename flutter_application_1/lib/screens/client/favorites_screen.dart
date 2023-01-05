import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/auth_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/card_widget.dart';
import 'package:riverpod/riverpod.dart';
import '../../services/fav_services.dart';
import '../../model/fav_model.dart';
import '../../services/trip_services.dart';

// final allUserFavProvider =
//     StreamProvider<List<FavModel>>((ref) => Fav_Service().viewAllFav());

class Fav extends ConsumerWidget {
  Widget myWidget(allFav, index) {
    return Container(
      child: cardWidget(
          imgpath: allFav[index].tripImg,
          tripname: allFav[index].tripName,
          eDate: allFav[index].eDate,
          price: allFav[index].price,
          sDate: allFav[index].sDate,
          tripId: allFav[index].tripId,
          tripdescription: allFav[index].tripdescription,
          triplocation: allFav[index].triplocation),
    );
    // Container(
    //   margin: EdgeInsets.fromLTRB(30, 30, 30, 30),
    //   child: Column(children: [
    //     Text(
    //       'My Favorites',
    //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
    //     ),
    //   ]),
    // ),
    // ]);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<List<FavModel>>(
      stream:
          Fav_Service().viewAllFav(ref.watch(curentUserProvider).value!.userid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final allFav = snapshot.data!;
          // print("DATAAAA" + allFav.toString());
          // if(ref.watch(curentUserProvider).value!.userid==allFav.forEach((favs) {favs.userId })){}
          return ListView.builder(
              itemCount: allFav.length,
              itemBuilder: (context, index) {
                return myWidget(allFav, index);
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
    // ListView(
    //   children: [
    // Consumer(
    //   builder: (context, ref, child) {
    //     final allFavs = ref.watch(allUserFavProvider);
    //     allFavs.when(
    //         data: (favs) => favs.forEach((fav) {
    //               if (favs.isNotEmpty) {}
    //             }),
    //         error: ((error, stackTrace) {
    //           Center(child: Text(error.toString()));
    //         }),
    //         loading: () =>
    //             const Center(child: CircularProgressIndicator()));
    //     return Container();
    //   },
    // ),
    // ],
    // );
  }
}
