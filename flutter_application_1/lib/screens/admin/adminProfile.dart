import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/admin/editadmin.dart';
import 'package:flutter_application_1/widgets/auth_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/users.dart';
import '../../widgets/adminform.dart';
import 'package:d_info/d_info.dart';

class adminProfile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: editAdmin(),
        appBar: AppBar(
          title: Text('Profile'),
        ));
  }
}
