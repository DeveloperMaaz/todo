import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:form_field_validator/form_field_validator.dart';
import 'login.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  bool circular = false;

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        key: formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black87,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 70.0,
              ),

              Container(
                width: MediaQuery.of(context).size.width - 70,
                height: 50.0,
                child: TextFormField(

                //  controller: emailcontroller,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "REQUIRED"),
                  ]),
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: "User Name",
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
                    ),
                  ),
                ),
              ),


              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 70,
                height: 50.0,
                child: TextFormField(
                  controller: emailcontroller,
                  validator:  (value){
                     if(value!.isEmpty){
                       return "Enter House no";
                     }
                   },
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: "Email........",
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
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                width: MediaQuery.of(context).size.width - 70,
                height: 50.0,
                child: TextFormField(
                  controller: passcontroller,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "REQUIRED"),
                  ]),
                  obscureText: true,
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: "Password....",
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
                      ))))),
              SizedBox(height: 38.0),
              Buttons(),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "If you already have an account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => login(),
                        ));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      )),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ButtonItem(String identity, String Name) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
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
              image: AssetImage(
                identity,
              ),
              width: 25.0,
              height: 25.0,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              Name,
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget Buttons(){
    return InkWell(
      onTap: () async{
        setState(() {
          circular = true;
        });

        try {
          firebase_auth.UserCredential userCredential =
              await firebaseAuth.createUserWithEmailAndPassword(
                  email: emailcontroller.text, password: passcontroller.text);
          print(userCredential.user!.email);
          setState(() {
            circular = false;
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => login()),
              (route) => false);
        } catch (e) {
          final snackbar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          setState(() {
            circular = false;
          });
        }

      },
      child: Container(
        width: MediaQuery.of(context).size.width - 90,
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
          child: circular
              ? CircularProgressIndicator()
              : Text(
                  "SignUp",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
        ),
      ),
    );
  }
}
