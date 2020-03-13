
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:workshop/test_view/test_detail_view_widget.dart';
import 'package:workshop/dummyData.dart';

class TestStartViewWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 71, 90, 239),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: ()=>Navigator.of(context).pop(),
                child: Container(
                  width: 14,
                  height: 14,
                  margin: EdgeInsets.only(
                    left: 24, 
                    top: 22 + MediaQuery.of(context).padding.top,
                    ),
                  child: Icon(Icons.close, color:Color(0xFF35D0BA))
                ),
              )
            ),
            Container(
              // width: 81,
              margin: EdgeInsets.only(top: 72),
              child: Text(
                "수업 참여 전",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Noto Sans CJK KR",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Text(
              "설문조사를 진행합니다.",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontFamily: "Noto Sans CJK KR",
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            Container(
                width: 82,
                height: 103,
                margin: EdgeInsets.only(top: 54),
                child: Image.asset(
                  "assets/images/test_image.png",
                  fit: BoxFit.none,
                ),
              ),
            Container(
              margin: EdgeInsets.only(top: 59),
              child: Text(
                "본 설문조사는 수업 참여 전 참가자의 이해도를\n확인하기 위해 진행되며, 총 15문항입니다.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Noto Sans CJK KR",
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: ()=>Navigator.push(context, CupertinoPageRoute(builder: (context)=>TestQuestionViewWidget(1, 2, questions[0]))),
              child: Container(
                width: 280,
                height: 60,
                margin: EdgeInsets.only(bottom: 114),
                child: Container(
                  width: 280,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0, 1),
                      end: Alignment(1, 1),
                      stops: [
                        0.10714,
                        0.89286,
                      ],
                      colors: [
                        Color.fromARGB(255, 53, 208, 186),
                        Color.fromARGB(255, 79, 87, 255),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "시작하기",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: "Noto Sans CJK KR",
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}