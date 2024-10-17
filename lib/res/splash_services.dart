import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:not_remote_server/res/session%20Controller.dart';

import '../Controller/home_controller.dart';

class SplashServices {
  void inLogin(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      sessionController().userId = user.uid.toString();
      HomeController homeController = Get.put(HomeController());
   homeController.fetchData();


      GoRouter.of(context).go(
        '/home',
      );
    } else {
      sessionController().userId = "";
      GoRouter.of(context).go('/loginScreen');
    }
  }
}
