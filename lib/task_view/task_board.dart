
import 'package:flutter/material.dart';
import 'package:workshop/task_view/task_detail.dart';
import 'package:workshop/values/values.dart';

class TaskBoardViewWidget extends StatefulWidget {
  @override
  _TaskBoardViewWidgetState createState() => _TaskBoardViewWidgetState();
}

class _TaskBoardViewWidgetState extends State<TaskBoardViewWidget> {

  void onRectangleTwoPressed(BuildContext context) {
  
  }
  
  void onRectanglePressed(BuildContext context) {
  
  }
  
  String selectOrder = "등록순";

  List<String> orders = ["등록순", "날짜순", "과제순", "팀순"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF4F57FF)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("과제 게시판", style:TextStyle(color: Colors.black)),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 60,
              margin: EdgeInsets.only(left: 17, top: 0, right: 17),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.only(left: 5, top: 10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 0,
                        top: 8,
                        child: Container(
                          width: 80,
                          height: 33,
                          decoration: BoxDecoration(
                            border: Border.fromBorderSide(Borders.secondaryBorder),
                            borderRadius: BorderRadius.all(Radius.circular(16.5)),
                          ),
                          child: Container(),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        top: 0,
                        child: DropdownButton<String>(
                          icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFF4F57FF), size: 18),
                          underline: SizedBox(),
                          value: selectOrder,
                          onChanged: (value) {
                            setState(() {
                              selectOrder = value;
                            });
                          },
                          items: orders.map((String user) {
                            return  DropdownMenuItem<String>(
                              value: user,
                              child: Text(user, style: TextStyle(fontSize: 15, color: Color(0xFF4F57FF)))
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  width: 220,
                  height: 33,
                  margin: EdgeInsets.only(top: 18, right: 0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 220,
                          height: 33,
                          padding: EdgeInsets.only(left:10, bottom: 4),
                          decoration: BoxDecoration(
                            border: Border.fromBorderSide(Borders.primaryBorder),
                            borderRadius: BorderRadius.all(Radius.circular(16.5)),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '검색',
                            ),
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            autocorrect: false,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          width: 40,
                          height: 26,
                          decoration: BoxDecoration(
                            color: Color(0xFF4F57FF),
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                          ),
                          child: Container(),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 17,
                        child: Image.asset(
                          "assets/images/search_icon.png",
                          fit: BoxFit.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaskDetailViewWidget()),
                );
              },
              child: Container(
                height: 60,
                margin: EdgeInsets.only(left: 8, top: 15, right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 4,
                        height: 4,
                        margin: EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 219, 68, 55),
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        ),
                        child: Container(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 255,
                        height: 65,
                        margin: EdgeInsets.only(left: 4, top: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "[DAY 01] 3차 과제 제출_5조_마법생태계",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: "Apple SD Gothic Neo",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                width: 255,
                                height: 25,
                                margin: EdgeInsets.only(left: 1, top: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "한기헌    2020.01.09. 22:19",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 136, 136, 136),
                                          fontFamily: "Apple SD Gothic Neo",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text(
                                          "조회 17",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 136, 136, 136),
                                            fontFamily: "Apple SD Gothic Neo",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 40,
                        height: 48,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Image.asset(
                                "assets/images/white_rec.png",
                                fit: BoxFit.none,
                              ),
                            ),
                            Positioned(
                              top: 11,
                              right: 13,
                              child: 
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 4),
                                    child: Text(
                                      "3",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontFamily: "Apple SD Gothic Neo",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                            ),
                            Positioned(
                              top: 23,
                              right: 13,
                              child: 
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 3),
                                    child: Text(
                                      "댓글",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 136, 136, 136),
                                        fontFamily: "Apple SD Gothic Neo",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 8,
                                      ),
                                    ),
                                  ),
                                ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.only(top: 0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 218, 218),
              ),
              child: Container(),
            ),
            
          ],
        ),
      ),
    );
  }
}