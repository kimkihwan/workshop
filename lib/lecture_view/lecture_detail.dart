import 'package:flutter/material.dart';
import 'package:workshop/join_view/user.dart';
import 'package:workshop/lecture_view/lecture.dart';
import 'package:workshop/task_view/menu.dart';
import 'package:workshop/task_view/task_upload.dart';
import 'package:workshop/test_view/test_start_view_widget.dart';
import 'package:http/http.dart';
import 'dart:convert';



class DailyViewWidget extends StatefulWidget {

  DailyViewWidget({person, this.lesson_no}) : this.person = person ?? User();

  User person;
  int lesson_no;

  @override
  _DailyViewWidgetState createState() => _DailyViewWidgetState();
}

class _DailyViewWidgetState extends State<DailyViewWidget> {

  @override
  void initState() {
    _makeGetRequest();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _makeGetRequest() async {

    Map<String, String> headers = {
      "Content-type": "application/json",
      'Authorization': "Bearer ${widget.person.token}"
    };

    // set up POST request arguments
    var url = 'https://withai.10make.com/api/lesson/${widget.lesson_no}/home';
    // make GET request
    Response response = await get(url, headers: headers);

    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    if (statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      for(Map<String, dynamic> i in jsonResponse['days']) {
        _daliyTitle.insert(i['day']-1, i['name']);
      }

      for(Map<String, dynamic> i in jsonResponse['data']) {
        _listViewData.add(LectureData(i['name'], i['day'], i['start'], i['end'], i['submit'], i['key'], i['type']));
      }
      
    }
  }

  static final List<String> _daliyTitle = [
  ];

  static final List<LectureData> _listViewData = [
  ];

  List<ExpansionTile> _listOfExpansions = List<ExpansionTile>.generate(
      3,
      (i) => ExpansionTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:10),
            Text('DAY 0${i+1}', style: TextStyle(fontSize: 14, color: Color(0xFF475AEF), fontWeight: FontWeight.bold),),
            SizedBox(height:10),
            Text(_daliyTitle[i], style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
            SizedBox(height:10),
          ],
        ),
        children: [
          Container(
            color: Colors.white,
            height: 91.0*_listViewData.length,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10),
              scrollDirection: Axis.vertical,
              itemCount: _listViewData.length,
              itemBuilder: (BuildContext context, int i) {
                if(i+1==_listViewData[i].day) {
                  return Column(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                        dense: true,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[             
                            Text(_listViewData[i].type, style: TextStyle(color: Colors.black, fontSize:13, fontWeight: FontWeight.bold)),
                            SizedBox(height:5),
                            Text(_listViewData[i].name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            SizedBox(height:5),
                            Text("${_listViewData[i].end}까지 제출", style: TextStyle(color: Color(0xFF979797))),
                            SizedBox(height:5),
                          ],
                        ),
                        trailing: 
                          FlatButton(
                            onPressed: () {
                              if (_listViewData[i].type == "survey") {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => TestStartViewWidget())
                                );
                              }
                              else if(_listViewData[i].type == "application") {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false, // user must tap button for close dialog!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Text(
                                          "PC를 이용해주세요.", textAlign: TextAlign.center,),
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
                              else {
                                Navigator.push(
                                  context, 
                                  MaterialPageRoute(builder: (context) => TaskUploadViewWidget())
                                );
                              }
                            },
                            color: _listViewData[i].end.compareTo(DateTime.now())>0?
                              Color(0xFF1F2232)
                              :_listViewData[i].submit==0?
                              Color(0xFF35D0BA)
                              :Color(0xFF4F57FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            textColor: Colors.white,
                            padding: EdgeInsets.all(0),
                            child: Text(
                              _listViewData[i].end.compareTo(DateTime.now())>0?
                              "제출마감"
                              :_listViewData[i].submit==0?
                              "미제출"
                              :"제출완료",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      )
                    ]
                  );
                }
                else
                  Container();
              }
            )
          )
        ],
        trailing: Icon(Icons.arrow_drop_down, color: Color(0xFF4F57FF)),
      ));
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            iconTheme: IconThemeData(color: Color(0xFF35D0BA)),
            leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_left, size: 30),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LectureMain()),
                );
              },  
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuViewWidget()),
                  );
                },
                child: Icon(Icons.menu, color: Color(0xFF475AEF)),
              )
            ],
            flexibleSpace: 
            Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  "assets/images/lec_black.png",
                  fit: BoxFit.cover,
                ),
                Center(
                  child: Text(
                    "\n\nSK그룹 AI 입문 과정\nAI-Workshop",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:Colors.white, 
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                )
              ],
            ),
            centerTitle: true,
          ),
          preferredSize: Size.fromHeight(150.0)
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: _listOfExpansions.map((expansionTile) => expansionTile).toList(),
        ),
      )
    );
  }
}

class LectureData {
  String name;
  int day;
  DateTime start;
  DateTime end;
  int submit;
  int key;
  String type;
  LectureData(this.name, this.day, this.start, this.end, this.submit, this.key, this.type);
}