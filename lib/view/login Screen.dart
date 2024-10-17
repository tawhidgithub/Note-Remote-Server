import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:not_remote_server/view/sing_up.dart';

import '../Controller/loginController.dart';
import '../res/Colors/colors.dart';
import '../res/component/Button/Button.dart';
import '../res/component/text_field.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  LoginState loginController=Get.put(LoginState());

  final _fromKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xff252525),
            appBar: AppBar(
              backgroundColor: const Color(0xff252525),
              title: Text(
                "Login",
                style: GoogleFonts.roboto(fontSize: 18,color: Colors.white),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Stack(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      key: _fromKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Login",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w700, fontSize: 25,color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Create an account to continue",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Accept the terms and conditions",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          textField(
                            isSuffixEyeShow: false,
                            onValidate: (value){
                              return value=="" ?"enter a Username or email":null;

                            },
                            Controller: loginController.emailController.value,
                            label: "Username or email address",
                            Bool: false,

                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          textField(
                            isSuffixEyeShow: true,
                            onValidate: (value){
                              return value=="" ?"enter a Password":null;
                            },
                            Controller: loginController.passController.value,
                            label: "Password",
                            icon1: FontAwesomeIcons.eye,
                            icon2: FontAwesomeIcons.eyeSlash,
                            Bool: true,
                            onClick: () {

                            },

                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: () {

                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: GoogleFonts.roboto(
                                        color: AppColors.primaryColorOrange,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Obx(() => ButtoN(
                            loding: loginController.loding.value,
                            title: "Login",
                            onClick: () {
                              if(_fromKey.currentState!.validate()){
                                loginController.login(context);

                              }
                            },
                          ),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account ?",
                              style: GoogleFonts.roboto(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15)),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () {
                                GoRouter.of(context).go('/singUpScreen');
                              },
                              child: Text("Register Now",
                                  style: GoogleFonts.roboto(
                                      color: AppColors.primaryColorOrange,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15))),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 230),
                  child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                    RotateAnimatedText("Email",
                        textStyle: GoogleFonts.roboto(
                            fontSize: 25,
                            color: AppColors.primaryColorOrange,
                            fontWeight: FontWeight.w700))
                  ]),
                )
              ]),
            ),
          ),
        );

  }
}
