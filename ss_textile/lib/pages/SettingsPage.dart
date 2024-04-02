import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement action for setting 1
              },
              child: Text('Setting 1'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement action for setting 2
              },
              child: Text('Setting 2'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement action for setting 3
              },
              child: Text('Setting 3'),
            ),
          ],
        ),
      ),
    );
  }
}
