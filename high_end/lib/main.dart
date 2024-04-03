import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
  
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () { runApp(MaterialApp(home:Scaffold(body: Center(child: Text("You unlocked the secret"),)))); }, 
            child: const Text("Go for it")),
        ),
      ),
    );
   }
}
