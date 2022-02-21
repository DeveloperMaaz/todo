import 'package:flutter/material.dart';

class appointDone extends StatelessWidget {
  const appointDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Text("Your Appointment is done !You can Check Your number From Your Number Tab:"
              ,style: TextStyle(
              fontSize: 25.0,

            ),),
        ),
      ),
    );
  }
}
