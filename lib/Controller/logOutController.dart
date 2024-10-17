
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../res/Utils/Utils.dart';
import '../res/session Controller.dart';


class LogOutController extends GetxController {


  final FirebaseAuth _auth = FirebaseAuth.instance;

  void logOut(BuildContext context) {
    _auth.signOut().then((value) {
      sessionController().userId = "";


      Utils().ErrorMesege("You've Been Log Out");
      if (context.mounted) {
        GoRouter.of(context).go('/loginScreen');
      }
    }).onError((error, stackTrace) {
      Utils().ErrorMesege(error.toString());
    });
  }
}
