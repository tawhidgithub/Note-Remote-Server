import 'dart:async';

import 'package:flutter/material.dart';

import '../res/splash_services.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState( )  {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {

      SplashServices().inLogin(context);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      body: Center(
        child: Text(
          "Notes",
          style: TextStyle(color: Colors.white, fontSize: 45),
        ),
      ),
    );
  }
}
