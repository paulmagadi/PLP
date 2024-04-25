import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'login_page.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Assignment',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          // Add a delay to simulate splash screen duration
          Future.delayed(Duration(seconds: 3), () {
            Navigator.pushReplacementNamed(context, '/login');
          });
        }
        return null;
      },
    );
  }
}
