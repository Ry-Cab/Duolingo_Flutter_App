import 'package:duolingo/pages/lesson_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Stateful Clicker Counter',
      theme: ThemeData(
        // Application theme data, you can set the colors for the application as
        // you want
        primarySwatch: Colors.blue,
      ),
      home: DuolingoPage(),
    );
  }
}

class DuolingoPage extends StatefulWidget {
  const DuolingoPage({ Key? key }) : super(key: key);

  @override
  State<DuolingoPage> createState() => _DuolingoPageState();
}

class _DuolingoPageState extends State<DuolingoPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Lesson(),
      ),
    );
  }
}