import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/edit_user_profile.dart';
import 'package:flutter_application_1/widgets/auth_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile_form extends ConsumerWidget {
  TextEditingController mailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    mailController.text = ref.watch(curentUserProvider).value!.email;
    pwController.text = ref.watch(curentUserProvider).value!.password;
    usernameController.text = ref.watch(curentUserProvider).value!.name;

    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.person,
              color: Colors.blue,
              size: 30,
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: ref.watch(curentUserProvider).value!.name,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.password,
              color: Colors.blue,
              size: 30,
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: pwController,
                decoration: InputDecoration(
                  hintText: ref.watch(curentUserProvider).value!.password,
                ),
              ),
            ),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     Icon(
        //       Icons.phone,
        //       color: Colors.blue,
        //       size: 30,
        //     ),
        //     SizedBox(
        //       width: 200,
        //       child: TextField(
        //         decoration: InputDecoration(
        //           hintText: 'Phone Number',
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.email,
              color: Colors.blue,
              size: 30,
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: mailController,
                decoration: InputDecoration(
                  hintText: ref.watch(curentUserProvider).value!.email,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        TextButton(
            onPressed: () {
              EditProfile editProfile = EditProfile();
              editProfile.editMyProfile(
                id: ref.watch(curentUserProvider).value!.userid,
                newMail: mailController.text,
                newPassword: pwController.text,
                newUsername: usernameController.text,
                type: ref.watch(curentUserProvider).value!.type,
              );
              DInfo.snackBarSuccess(context, 'Edit Success');
            },
            child: Text(
              'Edit',
              style: TextStyle(color: Colors.blue),
            )),
      ],
    );
  }
}
