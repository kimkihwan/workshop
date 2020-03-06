import 'package:flutter/material.dart';
import 'package:workshop/join_email_view.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: JoinEmailViewWidget(),
    );
  }
}
