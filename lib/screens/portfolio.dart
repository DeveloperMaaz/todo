import 'package:flutter/material.dart';
class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Portfolio')),),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text("Hey! I am Asma.I am a doctor of profession",style: TextStyle(fontSize: 30.0),),
          ),
        ),
      ),
    );
  }
}
