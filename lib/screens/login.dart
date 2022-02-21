import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:todo/secondly/homedoc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'forget.dart';
import 'googleAuth.dart';
import 'home.dart';

class login extends StatefulWidget {
 // const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passcontroller=TextEditingController();
  bool circular=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
           color: Colors.black87,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login',style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
              ),
              SizedBox(
                height: 70.0,
              ),
              // ButtonItem("asset/google.png","Continue with Google"),
              // SizedBox(height: 10.0),
              // ButtonItem("asset/cell.png","Continue with Mobile"),
              // SizedBox(height: 6.0),
              // Text("Or",style: TextStyle(
              //   fontSize: 28.0,
              //   color: Colors.white,
              //
              // ),),
              SizedBox(height: 6.0),
              Bottom("Email...", emailcontroller,false),
              SizedBox(height: 15.0),
              Bottom("Password...", passcontroller,true),
              SizedBox(height: 24.0),
              Buttons(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                    onPressed: () {
                      signInWithGoogle(context);
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 12.0)),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.grey[700])),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          height: 32.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Continue with Google',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'lato',
                          ),
                        )
                      ],
                    )),
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("If you don't  have an account?",style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                  ),),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, '/signup');
                  }, child: Text("Sign Up",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),),),

                ],
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>forget()));
                },
                child: Text("Forget Password",
                style: TextStyle(fontSize: 18.0,
                color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
  Widget ButtonItem(String identity,String Name){
    return Container(
      width: MediaQuery.of(context).size.width-60,
      height: 60.0,
      child: Card(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            width: 1.0,
            color: Colors.grey,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image(
              image: AssetImage(identity,
              ),
              width: 25.0,
              height: 25.0,

            ),
            SizedBox(
              width: 20.0,
            ),
            Text(Name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0
              ),
            ),

          ],
        ),
      ),
    );
  }
  Widget Bottom(String label,TextEditingController controller,bool obscuretext){

    return Container(
      width: MediaQuery.of(context).size.width-70,
      height: 50.0,
      child: TextFormField(
        controller: controller,
        obscureText: obscuretext,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                width: 1.5,
                color: Colors.amber,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                width: 1.0,
                color: Colors.grey,
              ),
            )
        ),
      ),
    );
  }
  Widget Buttons(){
    return TextButton(
      onPressed: ()async{

        final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
        sharedPreferences.setString('Email', emailcontroller.text);

        try{
          firebase_auth.UserCredential userCredential=await firebaseAuth.signInWithEmailAndPassword(email:emailcontroller.text, password: passcontroller.text);
          print(userCredential.user!.email);
          setState(() {
            circular =false;
          });
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>Home()), (route) => false);
        }
        catch(e){
          final snackbar=SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          setState(() {
            circular=false;
          });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width-90,
        height: 55.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffd746c),
              Color(0xffff9068),
              Color(0xffd746c),
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text("Login",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16.0,
            ),),
        ),
      ),
    );
  }

}