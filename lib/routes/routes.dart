


import 'package:go_router/go_router.dart';
import 'package:not_remote_server/view/home_page.dart';
import 'package:not_remote_server/view/login%20Screen.dart';
import 'package:not_remote_server/view/sing_up.dart';
import 'package:not_remote_server/view/splash_screen.dart';

import '../view/UpdateScreen.dart';
import '../view/add_note.dart';

GoRouter route=GoRouter(routes: [
GoRoute(name: 'splashScreen',path: '/',
builder: (context,state)=>SplashScreen()),
GoRoute(name:'home',path: '/home',
builder: (context,state)=>HomePage()),
GoRoute(name:'loginScreen' ,path: '/loginScreen',
builder: (context,state)=>LoginScreen()),
GoRoute(name: 'singUpScreen',path: '/singUpScreen',
builder: (context,state)=>SingUpScreen()),
GoRoute(
    name:'addNoteScreen',path: '/addNoteScreen',
builder: (context,state)=>AddNotes()),
  GoRoute(
    name: 'updateScreen',
      path: '/updateScreen/:title/:description/:keys',
builder: (context,state)=>UpdateNotes(title: state.pathParameters['title']!, description: state.pathParameters['description']!,keys:state.pathParameters['keys']! ,)),



]);
