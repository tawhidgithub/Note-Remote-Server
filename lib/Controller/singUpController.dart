
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../res/Utils/Utils.dart';
import '../view/home_page.dart';





///Sing up

class SingUpState extends GetxController {
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passController = TextEditingController().obs;
  final Rx<TextEditingController> firstNameController =
      TextEditingController().obs;
  final Rx<TextEditingController> lastNameController =
      TextEditingController().obs;
  final Rx<TextEditingController> userNameController =
      TextEditingController().obs;

  // Loging
  RxBool lodind = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child("User");

  // Obscure Text

  bool _eyes = true;

  get eyes => _eyes;

  void setEyes() {
    if (_eyes == false) {
      _eyes = true;
    } else if (_eyes == true) {
      _eyes = false;
    }


  }



  void setLoding(bool lod) {
    lodind.value = lod;
  }

  /// Sing Up

  void singUp(BuildContext context) {
    // var ID=DateTime.now().microsecondsSinceEpoch.toString();


    setLoding(true);
    _auth
        .createUserWithEmailAndPassword(
        email: emailController.value.text,
        password: passController.value.text)
        .then((value) {




      ref.child(value.user!.uid.toString()).set({
        "id":value.user!.uid.toString(),

        "email":value.user!.email.toString(),
        "password":passController.value.text.toString(),
        "username":userNameController.value.text.toString(),
        "fullname":firstNameController.value.text.toString() +""+lastNameController.value.text.toString(),




      })
          .then((value) {
        emailController.value.clear();
        passController.value.clear();
        firstNameController.value.clear();
        lastNameController.value.clear();
        userNameController.value.clear();
        GoRouter.of(context).go('/loginScreen');


      })
          .onError((error, stackTrace) {

      });
      Utils().ErrorMesege("Register is Successful");
      Get.to( HomePage(),duration: const Duration(seconds: 2));

      setLoding(false);
    }).onError((error, stackTrace) {
      setLoding(false);
      Utils().ErrorMesege(error.toString());



    });
  }
}
