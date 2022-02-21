import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/screens/login.dart';
import 'package:todo/screens/signup.dart';
import 'package:todo/screens/splash.dart';
import 'package:todo/secondly/adminPannel.dart';
import 'package:todo/secondly/apointscreen.dart';
import 'package:todo/secondly/homedoc.dart';
import 'package:todo/secondly/retrieve.dart';
import 'package:todo/secondly/second.dart';

int validat=0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  // void sign() async {
  //   try {
  //     await firebaseAuth.createUserWithEmailAndPassword(
  //         email: "maazajmal564@gmail.com", password: "112233");
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  //
  //  */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes:{
        '/':(context)=>Splash(),
        '/signup':(context)=>signUp(),
        '/second':(context)=>login(),
        '/homeDoct':(context)=>Home(),
        '/appointment':(context)=>Appointment(),
        '/adminPas':(context)=>second(),
        '/retrieve':(context)=>retrieve(),
        '/admin':(context)=>Admin(),

      },
    );
  }
}
