
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../res/Utils/Utils.dart';
import '../view/home_page.dart';





///Sing up

class SingUpState extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController firstNameController =
      TextEditingController();
  final TextEditingController lastNameController =
      TextEditingController();
  final TextEditingController userNameController =
      TextEditingController();







  // Loading
    RxBool loading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child("User");



  @override
  void dispose() {

    super.dispose();
    emailController.dispose();
    passController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
  }
  // Obscure Text

 final RxBool _eyes = true.obs;

  get isEyesEnable => _eyes.value;

  void setEyes() {
    if (_eyes.value == false) {
      _eyes.value = true;
    } else if (_eyes.value == true) {
      _eyes.value = false;
    }


  }



  void setLoading(bool lod) {
    loading.value = lod;
  }

  /// Sing Up

  void singUp(BuildContext context) {
    // var ID=DateTime.now().microsecondsSinceEpoch.toString();


    setLoading(true);
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

        GoRouter.of(context).go('/loginScreen');


      })
          .onError((error, stackTrace) {

      });
      Utils().ErrorMesege("Register is Successful");
      Get.to( HomePage(),duration: const Duration(seconds: 2));

      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils().ErrorMesege(error.toString());



    });
  }
}
