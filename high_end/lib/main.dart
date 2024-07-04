import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// TODO: Create a simple create app with some logic 

void main() {
  runApp(const JustAnApp());
  
}

class JustAnApp extends StatelessWidget {
  const JustAnApp({super.key});

  @override
  Widget build(BuildContext context) => DevWidget();

}

class CreationWidget extends StatefulWidget {

  const CreationWidget({super.key});

  @override
  State<StatefulWidget> createState() => CreationWidgetState();
  
}

class CreationEntity {

}

class CreationUseCase {
  final Map<String, CreationEntity> _entities = <String, CreationEntity>{};

  void AddItem(CreationEntity entitiy) {
    
  }
}

class CreationWidgetState extends State<StatefulWidget> {

  final TextEditingController nameController = TextEditingController();
  final CreationUseCase creationCase = CreationUseCase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: 
        [
          Row(children: [
            TextField(
              controller: nameController, 
              onSubmitted: (value) => {
                if (value.isEmpty) {

                }
              },
            ),
            Text(""),
            TextButton(onPressed: , child: child)
          ],)
        ],
      )
    );
  }

}