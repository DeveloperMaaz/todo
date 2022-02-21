import 'package:flutter/material.dart';
import 'package:todo/main.dart';

class second extends StatefulWidget {


  @override
  _secondState createState() => _secondState();
}

class _secondState extends State<second> {
  TextEditingController controllerE=TextEditingController();

  TextEditingController controllerP=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Dr.Asma(surgen)",
          ),
        ),
      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 28.0,right: 28.0,top: 50.0),
            child: TextFormField(

              controller: controllerE,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Enter Email",
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 28.0,right: 28.0),
            child: TextFormField(

              controller: controllerP,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.security_outlined),
                labelText: "Password",
              ),
            ),
          ),


          SizedBox(height: 18.0,),
          ElevatedButton(onPressed: (){

            if(controllerE.text=="maazajmal@gmail.com" && controllerP.text=="Admin1234"){
              setState(() {
                validat=1;
              });

              Navigator.pushNamed(context, '/admin');
            }
            return print("Error");
          },
            child: Text("Submit"),),
        ],
      ),
    );
  }
}
