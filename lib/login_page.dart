import 'package:flutter/material.dart';
import 'package:workshop/lecture.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPage createState() => _LoginPage();
}


class _LoginPage extends State<LoginPage> {
  TextStyle style = TextStyle(fontSize: 17.0, color: Colors.white);
  bool isInput = false;

  @override
  Widget build(BuildContext context) {
  
    final emailField = TextField(
      style: style,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "이메일",
        hintStyle: TextStyle(color: Color(0xFF444964)),
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
        border: InputBorder.none,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "비밀번호",
        hintStyle: TextStyle(color: Color(0xFF444964)),
      )
    );

    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 200,
                height: 36,
                margin: EdgeInsets.only(left: 40, top: 65),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 75,
                        height: 36,
                        child: Image.asset(
                          "assets/images/shape-51.png",
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 60,
                        height: 33,
                        margin: EdgeInsets.only(left: 3, top: 3),
                        child: Image.asset(
                          "assets/images/shape-95.png",
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 131,
                height: 33,
                margin: EdgeInsets.only(left: 41, top: 12),
                child: Image.asset(
                  "assets/images/shape-63.png",
                  fit: BoxFit.none,
                ),
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.only(left: 20, top: 44, right: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Image.asset(
                      "assets/images/shape-32.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  emailField,
                ],
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.only(left: 20, top: 9, right: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Image.asset(
                      "assets/images/shape-32.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  passwordField,
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 117,
                height: 11,
                margin: EdgeInsets.only(top: 19, right: 31),
                child: Image.asset(
                  "assets/images/shape-78.png",
                  fit: BoxFit.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LectureMain()),
                  );
              },
              child: 
              Container(
              height: 60,
              margin: EdgeInsets.only(left: 20, top: 63, right: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft, //Alignment(0, 0.5),
                          end: Alignment.centerRight, //Alignment(1, 0.5),
                          stops: [
                            0.15625,
                            0.94375,
                          ],
                          colors: isInput? [
                            Color.fromARGB(255, 53, 207, 187),
                            Color.fromARGB(255, 71, 90, 239),
                          ] : [
                            Color(0xFF444964),
                            Color(0xFF444964)
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    top: 24,
                    child: Image.asset(
                      "assets/images/shape-77.png",
                      fit: BoxFit.none,
                    ),
                  ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 11,
              margin: EdgeInsets.only(left: 96, right: 97, bottom: 101),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 120,
                      height: 11,
                      child: Image.asset(
                        "assets/images/shape-53.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 42,
                      height: 11,
                      child: Image.asset(
                        "assets/images/shape-57.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}