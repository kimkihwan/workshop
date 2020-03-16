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
  String email_check;
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