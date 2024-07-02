import 'package:flutter/material.dart';
import 'package:sqlite3/sqlite3.dart';
import 'database.dart';

void main() {
  PrepareDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Just testing'
      );
  }
}
