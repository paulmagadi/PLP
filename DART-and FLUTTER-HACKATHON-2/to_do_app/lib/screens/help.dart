import 'package:flutter/material.dart';
import '../constants/colors.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorAppBar,
        foregroundColor: colorWhite, //set Text and icon colors to white
        title: const Text('Help'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'How to Use This App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              '1. Add a new task using the input box and the "+" button.\n'
              '2. Complete a task by tapping on the checkbox next to it.\n'
              '3. Delete a task by tapping the delete icon.\n'
              '4. Use the search bar to find tasks quickly.\n',
            ),
            const SizedBox(height: 16),
            const Text(
              'FAQs',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Q: How do I add a task?\nA: Type the task description in the input box and tap the "+" button.\n\n'
              'Q: How do I mark a task as completed?\nA: Tap the checkbox next to the task.\n\n'
              'Q: How do I delete a task?\nA: Tap the delete icon next to the task.\n\n',
            ),
            const SizedBox(height: 16),
            const Text(
              'Contact Support',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Text(
            //   'If you need further assistance, please contact us at:\n'
            //   'support@taskmaster.com',
            // ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text:
                          "If you need further assistance, please contact us at:\n",
                      style: TextStyle()),
                  TextSpan(
                      text: "support@taskmaster.com",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
