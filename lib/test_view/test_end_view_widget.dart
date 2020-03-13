
import 'package:flutter/material.dart';
import 'package:workshop/lecture_view/lecture_detail.dart';



class TestEndViewWidget extends StatelessWidget {

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
            Container(
              margin: EdgeInsets.only(top: 128),
              child: Text(
                "설문참여 완료!",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Noto Sans CJK KR",
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 14),
              child: Text(
                "답변이 제출되었습니다.\n신중하고 성실한 답변에 감사드립니다.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: "Noto Sans CJK KR",
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(),
            Container(
              width: 70,
              height: 70,
              child: Image.asset(
                "assets/images/test_check_on.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: (){
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context){
                //     return new AlertDialog(
                //       title: new Text('clicked'), 
                //     );
                // });
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DailyViewWidget()));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 130),
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
                child: Center(
                  child: Text(
                    "확인",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: "Noto Sans CJK KR",
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.7,
                      fontSize: 15,
                    ),
                  ),
                )
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}