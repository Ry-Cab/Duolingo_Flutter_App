

import 'package:flutter/material.dart';

class CorrectPage extends StatefulWidget {
  const CorrectPage({ Key? key }) : super(key: key);

  @override
  State<CorrectPage> createState() => _CorrectPageState();
}

class _CorrectPageState extends State<CorrectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("Completou a lição, parabéns!", 
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,),),
            ),
            Image.asset('assets/images/clap_emoji.png'),
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text("Recomeçar"))
          ],
        ),
      ),
    );
  }
}