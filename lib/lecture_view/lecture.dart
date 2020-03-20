import 'package:flutter/material.dart';
import 'package:workshop/join_view/join_email_view.dart';
import 'package:workshop/join_view/user.dart';
import 'package:workshop/lecture_view/lecture_code.dart';
import 'package:workshop/lecture_view/lecture_detail.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:workshop/login_view/login.dart';


class LectureMain extends StatefulWidget {
  LectureMain({person, check}) : this.person = person ?? User();

  User person;

  bool check;

  @override
  _LectureMainState createState() => _LectureMainState();
}

class _LectureMainState extends State<LectureMain> {

  @override
  void initState() {
    if(widget.check==true)
      _makePostRequest();
    else
      person = widget.person;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  User person;

  _makePostRequest() async {

    Map<String, String> headers = {
      "Content-type": "application/json",
    };
    var body = '{"email":"${widget.person.name}", "password":"${widget.person.password}"}';
    // set up POST request arguments
    var url = 'https://withai.10make.com/api/login';
    // make GET request
    Response response = await post(url, headers: headers, body: body);
    // print(response.body);
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    if (statusCode == 200) {
      setState(() {
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        person.name = jsonResponse['user']['name'];
        person.email_check = jsonResponse['user']['email_verified_at'];
        person.photo = jsonResponse['user']['photo'];
        person.sub = jsonResponse['user']['sub'];
        person.dept = jsonResponse['user']['dept'];
        person.phone = jsonResponse['user']['phone'];
        person.token = jsonResponse['token'];
        // print('${person.token},${person.name}');
        if(jsonResponse['my_lesson']!='') {
          for(Map<String, dynamic> i in jsonResponse['my_lesson']) {
            person.lesson_list.add(Lesson(i['name'], i['company'], i['thumbnail'], i['lesson_no']));
          }
        }
      });      
    }
    else {
      showDialog(
        context: context,
        barrierDismissible: false, // user must tap button for close dialog!
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text(
                '다시 로그인 해주세요.', textAlign: TextAlign.center,),
            actions: <Widget>[
              FlatButton(
                child: Text('확인', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginMain()),
                  );
                }
              )
            ],
          );
        },
      );
    }
    
  }

  Widget lesson_view(company, name, thumbnail, lesson_no) {
    return GestureDetector(
      onTap: () {
        print(lesson_no);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DailyViewWidget(person: person, lesson_no: lesson_no),
          )
        );
      },
      child: Container(
        margin: EdgeInsets.only(left:10, right:10, top:20, bottom: 20),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color:Colors.white
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Center(
          child: ListTile(
            contentPadding: EdgeInsets.only(top:20, bottom:20, left:20),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  company, 
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )
                ),
                // SizedBox(height:10),
                Text(
                  name, 
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold            
                  )
                ),
                Container()
              ],
            ),
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color:Colors.white
                ),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  thumbnail,
                  fit: BoxFit.fitHeight,
                ),
            )
          ),
        ),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    var emptyLecture = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text("등록된 강의가 없습니다", style: TextStyle(color: Colors.white, fontSize: 28))
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 30,
          alignment: Alignment.topCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Align(
                child: Container(
                  alignment: Alignment.center,
                  child: Text("강의를 추가하려면", style: TextStyle(color: Color(0xFF939AC2), fontSize: 17))
                ),
              ),
              SizedBox(width: 5),
              Align(
                // alignment: Alignment.topLeft,
                child: Container(
                  width: 17,
                  height: 17,
                  margin: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF4F57FF),
                  ),
                  child: Image.asset(
                    "assets/images/path-2.png",
                    fit: BoxFit.none,
                  ),
                ),
              ),
              Align(
                child: Container(
                  alignment: Alignment.center,
                  child: Text("를 터치하세요.", style: TextStyle(color: Color(0xFF939AC2), fontSize: 17))
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        Spacer(),
        Spacer(),
        Spacer(),
      ],
    );

    var lectureButton = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left:10, right:10, bottom: 20),
          width: double.infinity,
          height: 130.0*person.lesson_list.length,
          child: Center(
            child: 
              ListView.builder(
                itemCount: person.lesson_list.length,
                itemBuilder: (BuildContext context, int i)
                {
                  return lesson_view(
                    person.lesson_list[i].company,
                    person.lesson_list[i].name,
                    person.lesson_list[i].thumbnail,
                    person.lesson_list[i].lesson_no
                  );
                }
              ),
          )
        )
      ],
    );
    
    return Scaffold(
      appBar: AppBar(
        title: Text("강의 목록"),
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        child: person.lesson_list.length!=0? lectureButton:emptyLecture  
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LectureCode(person: widget.person),
            )
          );
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xFF4F57FF),
      ),
    );
  }
}