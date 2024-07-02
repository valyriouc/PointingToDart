import 'package:flutter/material.dart';
import 'database.dart';

// /* Interface to represent a specific use case like login, registration and so on */
// abstract class UseCase {
  
// }

void main() {
  try {
    PrepareDatabase(); // Prepare database asynchronously
    runApp(const TodoApp());
  } catch (e) {
    // ignore: avoid_print
    print('Error: $e'); // Catch and print any errors
  }
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Just testing',
      home: Worker(),
    );
  }
}

class Worker extends StatefulWidget {
  const Worker({super.key});

  @override
  WorkerState createState() => WorkerState();
}

class WorkerState extends State<Worker> {
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Homepage")),
        body: Column(
          children: [
            Row(children: [
              ElevatedButton(onPressed: () {}, child: const Text("Button1")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreationPage()),
                    );
                  },
                  child: const Text("Create"))
            ]),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const ListTile(
                          title: Text('hello'), subtitle: Text('nice'));
                    }))
          ],
        ));
  }
}

class CreationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creation Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: Text('This is the creation page'),
      ),
    );
  }
}