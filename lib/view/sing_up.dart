  import 'package:animated_text_kit/animated_text_kit.dart';

  import 'package:flutter/material.dart';
  import 'package:font_awesome_flutter/font_awesome_flutter.dart';
  import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
  import 'package:google_fonts/google_fonts.dart';

  import '../Controller/singUpController.dart';
  import '../res/Colors/colors.dart';
  import '../res/component/Button/Button.dart';
  import '../res/component/text_field.dart';
import 'login Screen.dart';

  class SingUpScreen extends StatefulWidget {
    const SingUpScreen({super.key});


    @override
    State<SingUpScreen> createState() => _SingUpScreenState();
  }
  class _SingUpScreenState extends State<SingUpScreen> {
    final SingUpState singUpController = Get.put(SingUpState());
    final _formKey = GlobalKey<FormState>();

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
              "Register",
              style: GoogleFonts.roboto(fontSize: 18,color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          Text(
                            "Register",
                            style: GoogleFonts.roboto(color: Colors.white,
                                fontWeight: FontWeight.w700, fontSize: 25),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Create an account to continue",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 50),

                          textField(
                            isSuffixEyeShow: false,
                            onValidate: (value) {
                              return value == "" ? "enter First Name" : null;
                            },
                            Controller: singUpController.firstNameController.value,
                            label: "First Name",
                            Bool: false,
                          ),
                          const SizedBox(height: 5),
                          textField(
                            isSuffixEyeShow: false,
                            onValidate: (value) {
                              return value == "" ? "enter Last Name" : null;
                            },
                            Controller: singUpController.lastNameController.value,
                            label: "Last Name",
                            Bool: false,
                          ),
                          const SizedBox(height: 5),
                          textField(
                            isSuffixEyeShow: false,
                            onValidate: (value) {
                              return value == "" ? "enter User Name" : null;
                            },
                            Controller: singUpController.userNameController.value,
                            label: "User Name",
                            Bool: false,
                          ),
                          const SizedBox(height: 5),
                          textField(
                            isSuffixEyeShow: false,
                            onValidate: (value) {
                              return value == "" ? "enter a Email" : null;
                            },
                            Controller: singUpController.emailController.value,
                            label: "Email",
                            Bool: false,
                          ),
                          const SizedBox(height: 5),
                          textField(
                            isSuffixEyeShow: false,
                            onValidate: (value) {
                              return value == "" ? "enter a Password" : null;
                            },
                            Controller: singUpController.passController.value,
                            label: "Password",
                            icon1: FontAwesomeIcons.eye,
                            icon2: FontAwesomeIcons.eyeSlash,
                            Bool: true,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  "Forgot Password?",
                                  style: GoogleFonts.roboto(
                                      color: AppColors.primaryColorOrange,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Obx(() {
                            return ButtoN(
                              title: "Register",
                              loding: singUpController.lodind.value,
                              onClick: () {
                                FocusManager.instance.primaryFocus!.unfocus();                                if (_formKey.currentState!.validate()) {
                                  singUpController.singUp(context);
                                }
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: InkWell(
                        onTap: () {
                         GoRouter.of(context).go('/loginScreen');
                        },
                        child: Text(
                          "Already have an account ?",
                          style: GoogleFonts.roboto(
                              color: AppColors.primaryColorOrange,
                              fontWeight: FontWeight.w300,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 180),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      RotateAnimatedText("Email",
                          textStyle: GoogleFonts.roboto(
                              fontSize: 25,
                              color: AppColors.primaryColorOrange,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
