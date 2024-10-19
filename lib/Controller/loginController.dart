
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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  HomeController homeController = Get.put(HomeController());

  /// Loading
 final RxBool loading = false.obs;

  void setLoading(bool lod) {
    loading.value = lod;
  }
  @override
  void dispose() {

    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

 final RxBool _eyes = true.obs;

  get isEyesEnable => _eyes.value;

  void setEyes() {
    if (_eyes.value == false) {
      _eyes.value = true;
    } else if (_eyes.value == true) {
      _eyes.value = false;
    }

  }



  FirebaseAuth auth = FirebaseAuth.instance;



/// login
  void login(BuildContext context) {
    setLoading(true);
    auth
        .signInWithEmailAndPassword(
        email: emailController.value.text,
        password: passController.value.text)
        .then((value) {


      sessionController().userId=value.user!.uid.toString();


      Utils().ErrorMesege("Log In ");

      homeController.fetchData();

     GoRouter.of(context).go("/home");

      setLoading(false);
    }).onError((error, stackTrace) {
      Utils().ErrorMesege(error.toString());
      setLoading(false);
    });
  }
}
