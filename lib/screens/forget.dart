import 'package:flutter/material.dart';

class forget extends StatelessWidget {
  const forget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forget Password"),),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("This is not my problem that you forget your password You have to remember your password! So, Now SignUp Again From new email and enjoy...!!! "),
          ),
        ),
      ),
    );
  }
}
