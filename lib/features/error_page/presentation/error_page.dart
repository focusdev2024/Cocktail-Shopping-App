import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String errorMessage;

  const ErrorPage({super.key, this.errorMessage = "Something went wrong!"});

  @override
  Widget build(BuildContext context) {
    // You can customize this UI as you need
    return Scaffold(
      appBar: AppBar(title: Text("Error")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, size: 100, color: Colors.red),
            SizedBox(height: 20),
            Text(
              errorMessage,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Redirect the user back to a specific page, like HomePage
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
