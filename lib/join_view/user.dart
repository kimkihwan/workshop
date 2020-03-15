import 'dart:io';

class User {
  String name;
  String email;
  String password;
  String phone;
  String sub;
  String dept;
  String position;
  String token;
  bool email_check = false;
  List<Lesson> lesson_list = [];
  String photo;
  File user_file;
}

class Lesson {
  String name;
  String company;
  String thumbnail;
  Lesson(this.name, this.company, this.thumbnail);
}