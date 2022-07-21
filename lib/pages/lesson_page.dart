import 'dart:ffi';

import 'package:duolingo/pages/correct_page.dart';
import 'package:flutter/material.dart';

class Lesson extends StatefulWidget {
  const Lesson({ Key? key }) : super(key: key);

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {

  String phaseData = "hello";
  String translated = "olá";
  String textInput = "";
  int lessonNumber = 0;

  List<Map<String, dynamic>> phases = [
    {
      "word": "hello",
      "translated": "ola"
    },
    {
      "word": "apple",
      "translated": "maça"
    },
    {
      "word": "Thank you!",
      "translated": "obrigado"
    }
  ];
  
  var textFieldController = TextEditingController();
  double progressIndicatorValue = 0;
  

  @override
  Widget build(BuildContext context) {
    double progressingValue = phases.length/10;

    return Container(
      color: Colors.black12,
      child: Column(
            children: [
              
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.close_rounded)),
                  Container(
                  width: 350,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                    value: progressIndicatorValue,
                    semanticsLabel: 'Linear progress indicator',
                    minHeight: 10,
                    backgroundColor: Colors.black12,
                    color: Colors.green,
                                  ),
                  ),
               ),
                ],
              ),
               
              Text(
                "Traduza essa palavra",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.left,
              ),
              Text(phases[lessonNumber]["word"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          
                          onChanged: (value) {
                            setState(() {
                              textInput = value;
                            });
                          },
                          maxLines: 10,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Digite a tradução aqui :)'
                          ),
                          controller: textFieldController,
                        ),
                      ),
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    Container(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      print(textInput);
                      print(phases[lessonNumber].containsValue(textInput));

                      var result = phases[lessonNumber].containsValue(textInput);

                      if(result){
                      
                        lessonNumber = lessonNumber + 1;
                        
                        if(lessonNumber != phases.length){
                          setState(() {});
                          progressIndicatorValue = progressIndicatorValue + progressingValue;
                          textFieldController.clear();
                        }else{
                          setState(() {
                            lessonNumber = 0;
                            progressIndicatorValue = 1;
                            Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => CorrectPage(),
                            ),
                            );
                          });
                          
                          

                        }
                           
                      }else{
                        print("incorreto");
                      }
                    },
                    child: Text("Enviar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff00E25B), 
                    ),
                  ),
                )
                  ],
                ),
              ),
              
            ],
          ),
    );
  }
}