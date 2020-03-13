import 'package:flutter/material.dart';
import 'package:workshop/join_view/join_check_view.dart';
import 'package:workshop/join_view/join_second_view.dart';
import 'package:workshop/join_view/user.dart';
import 'package:workshop/lecture_view/lecture_detail.dart';
import 'package:workshop/login_view/login.dart';
import 'package:workshop/task_view/menu.dart';
import 'package:workshop/task_view/task_upload.dart';



void main() => runApp(App());

class App extends StatelessWidget {
  User person;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoginMain(),
    );
  }
}
