import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workshop/join_view/user.dart';
import 'package:workshop/lecture_view/lecture.dart';
import 'package:workshop/lecture_view/lecture_detail.dart';
import '../fadecircle.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:async/async.dart';


class JoinEmailViewWidget extends StatefulWidget {
  User person;
  JoinEmailViewWidget({person}) : this.person = person ?? User();

  @override
  _JoinEmailViewWidgetState createState() => _JoinEmailViewWidgetState();
}

class _JoinEmailViewWidgetState extends State<JoinEmailViewWidget>
    with SingleTickerProviderStateMixin {

  
  _makeGetRequest(token) async {

    Map<String, String> headers = {
      "Content-type": "application/json",
      'Authorization': "Bearer ${widget.person.token}"
    };

    // set up POST request arguments
    var url = 'https://withai.10make.com/api/check/email/verify';
    // make GET request
    http.Response response = await http.get(url, headers: headers);

    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    if (statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var check = jsonResponse['verify'];
      if(check=='Y') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LectureMain(person: widget.person)),
        );
      }
    }
    
  }

  _makePostRequest() async {
    var stream = http.ByteStream(DelegatingStream.typed(widget.person.user_file.openRead()));
    var length = await widget.person.user_file.length();
    var multipartFile = new http.MultipartFile('photo', stream, length,
          filename: widget.person.user_file.path.split('/').last);

    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept-Charset': 'UTF-8'
    };

    // set up POST request arguments
    var url = Uri.parse('https://withai.10make.com/api/register');
    http.MultipartRequest request = http.MultipartRequest('POST', url);
    request.headers.addAll(headers);
    request.fields['name'] = widget.person.name;
    request.fields['email'] = widget.person.email;
    request.fields['password'] = widget.person.password;
    request.fields['password_confirmation'] = widget.person.password;
    request.fields['phone'] = widget.person.phone;
    request.fields['sub'] = widget.person.sub;
    request.fields['dept'] = widget.person.dept;
    request.fields['position'] = widget.person.position;
    request.files.add(multipartFile);
    // make POST request
    // Response response = await post(url, headers: headers, body: json);
    print(request.fields);
    var response = await request.send();
    // check the status code for the result

    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    if (statusCode == 200) {
      response.stream.transform(convert.utf8.decoder).listen((value) {
        final body = convert.json.decode(value);
        widget.person.token = body['token'];
        Timer(Duration(seconds: 1), () {
          print(body);
          _makeGetRequest(body['token']);
        });
      });
    }
  }

  @override
  void initState() {
    if(widget.person.photo==null) {
      _makePostRequest();
    } else {
      Timer(Duration(seconds: 1), () {
        _makeGetRequest(widget.person.token);
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LectureMain()),
            );
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Container()),
                Container(
                  width: double.infinity,
                  height: 40,
                  margin: EdgeInsets.only(left:30, right:30),
                  child: Text(
                    "메일 인증 대기 중입니다.", 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  margin: EdgeInsets.only(left:30, right:30, top: 20),
                  child: Text(
                    "인증이 완료되면 서비스를 이용하실 수 있습니다.\n메일로 이동하여 이메일 인증을 완료해주세요.", 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF939AC2),
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.only(left:30, right:30, top: 50),
                  child: SpinKitFadingCircle(
                    size: 100,
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  // height: 40,
                  margin: EdgeInsets.only(left:40, right:40, top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "인증 메일을 수신하지 못하셨나요?", 
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFC4C4C4),
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "  재발송",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF4F57FF),
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      )
                    ],
                  )
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        )
      ),
    );
  }
}