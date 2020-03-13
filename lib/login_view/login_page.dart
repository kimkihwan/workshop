import 'package:flutter/material.dart';
import 'package:workshop/join_view/join_check_view.dart';
import 'package:workshop/join_view/join_first_view.dart';
import 'package:workshop/lecture_view/lecture.dart';
import 'package:http/http.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPage createState() => _LoginPage();
}


class _LoginPage extends State<LoginPage> {
  TextStyle style = TextStyle(fontSize: 17.0, color: Colors.white);
  bool isInput = false;

  String _emailValue;
  String _passwordValue;

  _makePostRequest() async {

    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    var body = '{"email":"${_emailValue}", "password":"${_passwordValue}"}';
    // set up POST request arguments
    var url = 'https://withai.10make.com/api/login';
    // make GET request
    Response response = await post(url, headers: headers, body: body);
    print("post");
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    if (statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      var check = jsonResponse['error']['error'];
      print(check);
      if(check=='N') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LectureMain(isAdd: false)),
        );
      }
    }
    else {
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap button for close dialog!
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text(
                '아이디 혹은 비밀번호가 틀렸습니다.', textAlign: TextAlign.center,),
            actions: <Widget>[
              FlatButton(
                child: Text('확인', style: TextStyle(color: Colors.white)),
                onPressed: () => Navigator.of(context).pop()
              )
            ],
          );
        },
      );
    }
    
  }
  
  TextField inputText(String hintText, bool obscure) {
    return TextField(
      onChanged: (value) {
        if (obscure) {
          if (value.length > 4) 
            setState(() {
              isInput = true;
            });
          else
            setState(() {
              isInput = false;
            });
        }
        if (hintText=='이메일') {
          _emailValue = value;
        } else {
          _passwordValue = value;
        }
      },
      obscureText: obscure,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left:20, top: 20, bottom: 20),
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(32),
        ),
        fillColor: Color(0xFF35D0BA),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF35D0BA), width: 2.0),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Spacer(),
            Container(
              width: 139,
              height: 36,
              margin: EdgeInsets.only(left: 40, top: 39),
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
            Container(
              width: 140,
              height: 50,
              margin: EdgeInsets.only(left: 41, top: 11),
              child: Text("준비물까지 준비해주는\n온라인 클래스", style: TextStyle(color: Color(0xFF939AC2)),)
            ),
            Spacer(),
            Container(
              // height: 120,
              margin: EdgeInsets.only(left: 20, top: 44, right: 20),
              child: inputText("이메일", false)
            ),
            Container(
              // height: 120,
              margin: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: inputText("비밀번호", true)
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
                print(isInput);
                if (isInput) {
                  _makePostRequest();
                }
              },
              child: 
              Container(
                alignment: Alignment.center,
                height: 60,
                margin: EdgeInsets.only(left: 20, top: 63, right: 20),
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
                child: Text(
                  "로그인", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 14,
                  )
                )
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: 15,
              margin: EdgeInsets.only(left: 96, right: 97, bottom: 101),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Text(
                        "아직 계정이 없으신가요?", 
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 12,
                        )
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JoinCheckViewWidget()),
                        );
                      },
                      child: Text(
                        "가입하기", 
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color(0xFF35D0BA),
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                        )
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