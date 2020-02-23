import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'values/values.dart';


class TaskDetailViewWidget extends StatefulWidget {
  @override
  _TaskDetailViewWidgetState createState() => _TaskDetailViewWidgetState();
}

class _TaskDetailViewWidgetState extends State<TaskDetailViewWidget> {

  List<String> edits = ["수정", "삭제"];

  List<Reply> replys = [
    Reply(date: "2020.01.09. 22:36", name: "최귀상_3조", text: "수고하셨습니다."),
    Reply(date: "2020.01.09. 20:36", name: "이진주_3조", text: "수고하셨습니다."),
    Reply(date: "2020.01.09. 19:36", name: "이정인_3조", text: "수고하셨습니다."),
  ];

  bool isInput = false;

  TextEditingController _replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("과제 게시판", style: TextStyle(color:Colors.black)),
        actions: <Widget>[
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return edits.map((String value) {
                return PopupMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: value=="삭제"?Colors.red:Colors.black),),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Container(
        // constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 275,
                margin: EdgeInsets.only(left: 16, top: 3),
                child: Text(
                  "[DAY 01] 3차 과제 제출_5조_마법생태계",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: "Noto Sans CJK KR",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 204,
                height: 40,
                margin: EdgeInsets.only(left: 16, top: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          "assets/images/white_one.png",
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 100,
                        height: 60,
                        margin: EdgeInsets.only(left: 10, top: 1),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "한기헌",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: "Noto Sans CJK KR",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "2020.01.09. 22:19",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 146, 146, 146),
                                    fontFamily: "Noto Sans CJK KR",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
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
                        margin: EdgeInsets.only(left: 12, top: 21),
                        child: Text(
                          "조회 17",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromARGB(255, 146, 146, 146),
                            fontFamily: "Noto Sans CJK KR",
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.only(top: 14),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 218, 218),
              ),
              child: Container(),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(left: 16, top: 18, right: 16),
                child: Text(
                  "AI  오프라인 워크샵 웹/모바일 시나리오 산업 전반에 적용된 AI를 이해할 수 있다. 티처블머신을 이용해 AI 모델을 만들고 IoT기기에 적용할 수 있다. AI를 활용한 서비스 융합기획을 할 수 있다.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: "Noto Sans CJK KR",
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 218, 218),
              ),
              child: Container(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 45,
                height: 15,
                margin: EdgeInsets.only(left: 16, top: 9),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "첨부파일",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Noto Sans CJK KR",
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 2, top: 3),
                        child: Text(
                          "1",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Noto Sans CJK KR",
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
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 72,
                height: 72,
                margin: EdgeInsets.only(left: 20, top: 9),
                child: Image.asset(
                  "assets/images/green_rec.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 218, 218),
              ),
              child: Container(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 26,
                height: 15,
                margin: EdgeInsets.only(left: 17, top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "댓글",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Noto Sans CJK KR",
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 1, top: 3),
                        child: Text(
                          "3",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromARGB(255, 79, 87, 255),
                            fontFamily: "Noto Sans CJK KR",
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   height: 1,
                    //   margin: EdgeInsets.only(bottom: 38),
                    //   decoration: BoxDecoration(
                    //     color: Color.fromARGB(255, 218, 218, 218),
                    //   ),
                    //   child: Container(),
                    // ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: 
              ListView.builder(
                itemCount: replys.length+1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == replys.length) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("댓글 입력"),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(20.0)), //this right here
                              content: Container(
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextField(
                                        autofocus: true,
                                        onChanged: (string) {
                                          setState(() {
                                            if (string.length > 1)
                                              isInput = true;
                                            else {
                                              isInput = false;
                                            }
                                          });
                                        },
                                        controller: _replyController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '댓글을 입력해주세요'
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: (){
                                    if (isInput) {
                                      isInput = false;
                                      _replyController.clear();
                                      Navigator.of(context).pop();
                                    }
                                  }, 
                                  child: Text("등록")
                                ),
                                FlatButton(
                                  onPressed: () {
                                    isInput = false;
                                    _replyController.clear();
                                    Navigator.of(context).pop();
                                  }, 
                                  child: Text("취소")
                                ),
                              ],
                            );
                          }
                        );
                      },
                      child: 
                        Padding(
                          padding: EdgeInsets.only(top:10),
                          child:
                            Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 95,
                                    height: 18,
                                    margin: EdgeInsets.only(left:25, bottom: 16),
                                    child:
                                      Text(
                                        "댓글을 남겨보세요.",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 181, 181, 181),
                                          fontFamily: "Noto Sans CJK KR",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                        ),
                                      ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  margin: EdgeInsets.only(bottom: 38),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 218, 218, 218),
                                  ),
                                  child: Container(),
                                ),
                              ],
                            )
                        )
                    );
                  }
                  return ListTile(
                    title: 
                      Padding(
                        padding: EdgeInsets.only(left:10),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(replys[index].name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text(replys[index].text, style: TextStyle(fontSize: 12)),
                            SizedBox(height: 5),
                            Text(replys[index].date, style: TextStyle(fontSize: 11, color: Colors.grey)),
                            SizedBox(height: 5),
                            Container(
                              height: 1,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 218, 218, 218),
                              ),
                              child: Container(),
                            ),
                          ]
                        )
                      )
                  );
                }
              ),
            ),
          ]
        )
      )
    );
  }
}

class Reply {
  String name;
  String text;
  String date;

  Reply({this.name, this.text, this.date});
}

class InputReply extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF000000)),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
        title: Text("댓글 입력", style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          FlatButton(
            onPressed: null, 
            child: Text("등록", style: TextStyle(color: Colors.blue),)
            )
        ],
      ),
      body: 
        TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '댓글을 입력해주세요',
          ),
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          maxLines: 1,
          autocorrect: false,
        ),
    );
  }
}