import 'package:flutter/material.dart';
import 'package:workshop/login.dart';
import 'package:workshop/task_board.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskBoardViewWidget(),
    );
  }
}
