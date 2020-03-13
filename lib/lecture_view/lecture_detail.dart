import 'package:flutter/material.dart';
import 'package:workshop/lecture_view/lecture.dart';
import 'package:workshop/task_view/menu.dart';
import 'package:workshop/task_view/task_upload.dart';
import 'package:workshop/test_view/test_start_view_widget.dart';


class DailyViewWidget extends StatefulWidget {
  @override
  _DailyViewWidgetState createState() => _DailyViewWidgetState();
}

class _DailyViewWidgetState extends State<DailyViewWidget> {
  static final List<String> _daliyTitle = [
    '산업 도메인과 AI의 결합',
    'AI 산업에서의 UX/UI',
    'AI 아키텍처와 상품화'
  ];

  static final List<String> _listViewData = [
    'AI-Workshop 사전 설문조사',
    '워크샵 - AI 모델 만들기',
    '티쳐블머신 활용해서 비전인식 학습',
    'WebRTC 활용해서 음성인식 학습 이해하기'
  ];

  static final List<String> _listDatatype = [
    '설문조사',
    '1차 과제',
    '2차 과제',
    '3차 과제',
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
                return Column(
                  children: <Widget>[
                    Divider(),
                    ListTile(
                      dense: true,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[                         
                          Text(_listDatatype[i], style: TextStyle(color: Colors.black, fontSize:13, fontWeight: FontWeight.bold)),
                          SizedBox(height:5),
                          Text(_listViewData[i], style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                          SizedBox(height:5),
                          Text("2020년 00월 00일까지 제출", style: TextStyle(color: Color(0xFF979797))),
                          SizedBox(height:5),
                        ],
                      ),
                      trailing: 
                        FlatButton(
                          onPressed: () {
                            if (i == 0) {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => TestStartViewWidget())
                              );
                            } else {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => TaskUploadViewWidget())
                              );
                            }
                          },
                          color: Color(0xFF35D0BA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          textColor: Colors.white,
                          padding: EdgeInsets.all(0),
                          child: Text(
                            "미제출",
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
                  MaterialPageRoute(builder: (context) => LectureMain(isAdd: true)),
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