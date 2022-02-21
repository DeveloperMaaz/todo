import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:todo/main.dart';

import 'apointDone.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  TextEditingController control1 = TextEditingController();
  TextEditingController control2 = TextEditingController();
  TextEditingController control3 = TextEditingController();

     GlobalKey<FormState> formKey=GlobalKey<FormState>();

     //one way
  // void productive(){
  //
  //   final FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  //   CollectionReference collectionReference= FirebaseFirestore.instance.collection('Products');
  //
  //   var newProductData={
  //     "Patient Name": control1.text,
  //     "Address": control2.text,
  //     "Contact": control3.text,
  //   };
  //
  //   collectionReference.doc().set(newProductData);
  //   }
  // second way same

  void valideates() {
    if (formKey.currentState!.validate()) {

      Map<String, dynamic> data = {
        "Patient Name": control1.text,
        "Address": control2.text,
        "Contact": control3.text,
        "createdTime":DateTime.now(),
        "UpdatedAt":DateTime.now(),
      };
      FirebaseFirestore.instance.collection("test").add(data);

      control1.clear();
      control2.clear();
      control3.clear();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Data sent to doctor"),
      ));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>appointDone()));
    }
  }

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
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              Hero(
                tag: 'Dash',
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/doctorz.jpg",
                  ),
                  radius: 60.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                  child: Text(
                " Dear Patient!!",
              )),
              Center(
                  child: Text(
                " Enter Your Apointment Here!",
              )),
              SizedBox(
                height: 18.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                child: TextFormField(
                  controller: control1,
                  //  validator: EmailValidator(errorText: "Invalid Format"), single
                  validator: MultiValidator([
                    RequiredValidator(errorText: " Required"),
                  ]),

                  // validator: (value){
                  //   if(value!.isEmpty){
                  //     return "Enter Name";
                  //   }
                  // },

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.drive_file_rename_outline),
                    labelText: "Enter a patient Name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                child: TextFormField(
                  controller: control2,

                  validator: MultiValidator([
                    RequiredValidator(errorText: " Required"),
                  ]),

                  // validator: (value){
                  //   if(value!.isEmpty){
                  //     return "Enter House no";
                  //   }
                  // },

                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.add_location_rounded),
                    labelText: "Address",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                child: TextFormField(
                  controller: control3,

                  validator: MultiValidator([
                    RequiredValidator(errorText: " Required"),
                    MinLengthValidator(8, errorText: "Al least Enter 8 number"),
                  ]),

                  // validator: (value){
                  //   if(value!.isEmpty){
                  //     return "Contact required";
                  //   }
                  //   else if(value.length<11){
                  //     return "contact at least 11";
                  //   }
                  // },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_bluetooth_speaker),
                    labelText: "Contact Number",
                  ),
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              ElevatedButton(
                onPressed: () {
                  valideates();
                },
                child: Text("Send To Doctor"),
              ),
              SizedBox(
                height: 18.0,
              ),
              ElevatedButton(
                onPressed: ()async {

                  Navigator.pushNamed(context, '/retrieve');
                },
                child: Text("Your Number List "),
              ),
              SizedBox(
                height: 18.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if(validat==0){
                    Navigator.pushNamed(context, '/adminPas');
                  }
                  else{
                    Navigator.pushNamed(context, '/admin');
                  }

                },
                child: Text("Doctor Use only !"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
