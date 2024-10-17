
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:not_remote_server/view/home_page.dart';

import '../res/Utils/Utils.dart';
import '../res/session Controller.dart';
import 'fetchDataController.dart';
import 'home_controller.dart';

// class LoginScreenState with ChangeNotifier {
//   // Obscure Text
//
//   bool _eyes = true;
//
//   get Eyes => _eyes;
//
//   void setEyes() {
//     if (_eyes == false) {
//       _eyes = true;
//     } else if (_eyes == true) {
//       _eyes = false;
//     }
//
//     notifyListeners();
//   }
//
// // Login
// }

class LoginState extends GetxController {
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passController = TextEditingController().obs;
  HomeController homeController = Get.put(HomeController());

  /// Loding
  RxBool loding = false.obs;

  void setLoding(bool lod) {
    loding.value = lod;
  }

  FirebaseAuth auth = FirebaseAuth.instance;




  void login(BuildContext context) {
    setLoding(true);
    auth
        .signInWithEmailAndPassword(
        email: emailController.value.text,
        password: passController.value.text)
        .then((value) {


      sessionController().userId=value.user!.uid.toString();


      Utils().ErrorMesege("Log In ");
      emailController.value.clear();
      passController.value.clear();
      homeController.fetchData();

     GoRouter.of(context).go("/home");

      setLoding(false);
    }).onError((error, stackTrace) {
      Utils().ErrorMesege(error.toString());
      setLoding(false);
    });
  }
}
