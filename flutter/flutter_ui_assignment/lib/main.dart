import 'package:flutter/material.dart';

void main(){
  runApp(const SplashScreen());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar (
          title: const Center(
            child: Text("Hello"),
          ),
        ),
    ),
    );
  }
}