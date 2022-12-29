import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/auth_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile_form extends ConsumerWidget {
  const Profile_form({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                decoration: InputDecoration(
                  hintText: ref.watch(curentUserProvider).value!.password,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.phone,
              color: Colors.blue,
              size: 30,
            ),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                ),
              ),
            ),
          ],
        ),
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
                decoration: InputDecoration(
                  hintText: ref.watch(curentUserProvider).value!.email,
                ),
              ),
            ),
          ],
        )
      ],
    );
    TextButton(
        onPressed: () {
          // context.go('/EditProfile');
        },
        child: Text(
          'Edit',
          style: TextStyle(color: Colors.blue),
        ));
  }
}
