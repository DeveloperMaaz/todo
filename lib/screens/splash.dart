import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/screens/login.dart';
import 'package:todo/screens/signup.dart';
import 'package:todo/secondly/homedoc.dart';

var finalEmail ;
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () =>
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => login()),
        ),
    );
  }
    // getValidation().whenComplete(() async{
    //   super.initState();
    //   Timer(Duration(seconds: 4), ()=>Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => finalEmail==null?login():Home()),
    //   ),
    //   );
    // });
  /*
  Future getValidation()async{
    final SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    var obteindEmail=sharedPreferences.get('Email');
    setState(() {
      finalEmail=obteindEmail;
    });
  }
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         SizedBox(width: 350,height: 150,),
          CircleAvatar(
            backgroundImage:  AssetImage("assets/images/doctorz.jpg",
            ),
            radius: 60.0,
          ),
          SizedBox(height: 20.0,),

          Center(
            child: Text("Dr Asma",style: TextStyle(
              fontSize: 24.0,
              color: Colors.green,
            ),),
          ),

          SizedBox(height: 50.0,),

          CircularProgressIndicator(
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
