import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Task Master'),
      ),
      body: const Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'About This App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 16),
             Text(
              'This is a to-do app designed to help you stay organized and manage your tasks effectively. '
              'You can add, complete, and delete tasks as needed.',
            ),
             SizedBox(height: 16),
             Text(
              'Version: 1.0.0',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
             SizedBox(height: 16),
             Text(
              'Developed by: Your Name',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
