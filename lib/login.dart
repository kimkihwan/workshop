import 'package:flutter/material.dart';
import 'package:workshop/lecture.dart';
import 'package:workshop/join.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextStyle style = TextStyle(fontSize: 17.0);
  bool isInput = false;

  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "이메일",
          border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC4C4C4)))
      )
    );

    final passwordField = TextField(
      onChanged: (string) {
        setState(() {
          if (string.length > 4)
            isInput = true;
          else {
            isInput = false;
          }
        });
      },
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "비밀번호",
          border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC4C4C4)))
      )
    );

    final joinText = FlatButton(
      child: Text("아직 계정이 없으신가요?", style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => JoinPage()));
      },
    );

    final loginButon = Material(
      elevation: 0.0,
      borderRadius: BorderRadius.circular(5.0),
      color: isInput? Color(0xFFFEA42F) : Colors.grey,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        height: 65,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: isInput? () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LectureMain()),
          );
        } : null,
        child: Text("로그인",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text("로그인", style: TextStyle(color:Colors.black, fontSize: 18)),
        backgroundColor: Color(0xFFF2F2F2),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
      child: Center(
        child: Container(
          color: Color(0xFFF2F2F2),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30.0),
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 10.0),
                passwordField,
                SizedBox(height: 40.0),
                joinText,
                SizedBox(height: 40.0),
                loginButon,
                SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ),
      ),
      backgroundColor: Color(0xFFF2F2F2),
    );
  }
}

