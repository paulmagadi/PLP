import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/home.dart';
import './screens/about.dart';
import './screens/help.dart';
import './screens/calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //root widget
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor:
            Colors.transparent)); //set status bar color to transparent
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove DEBUG banner
      title: 'To Do App',
      home: const Home(),
      routes: {
        '/about': (context) => AboutPage(), //Route to About Page/screen
        '/help': (context) => HelpPage(), //Route to Help Page/screen
        '/calendar': (context) =>
            CalendarPage(), //Route to Calendar Page/screen
      }, //Home view
    );
  }
}
