
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:workshop/test_view/test_end_view_widget.dart';
import 'package:workshop/dummyData.dart';

class TestQuestionViewWidget extends StatefulWidget{
  final currentQuestionIndex;
  final totalQuestionIndex;
  final String questionText;

  TestQuestionViewWidget(this.currentQuestionIndex, this.totalQuestionIndex, this.questionText);
  
  @override
  _TestQuestionViewWidget createState() => new _TestQuestionViewWidget(this.currentQuestionIndex, this.totalQuestionIndex, this.questionText);

}

class _TestQuestionViewWidget extends State<TestQuestionViewWidget> {
  final currentQuestionIndex;
  final totalQuestionIndex;
  final String questionText;

  _TestQuestionViewWidget(this.currentQuestionIndex, this.totalQuestionIndex, this.questionText);

  int choosenIndex = 0;

  Widget questionNumber(int currentQuestion, int totalQuestion){
    return Column(
      children: <Widget>[
        Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 25),
            child: Container(
                width: 81,
                height: 33,
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(
                    color: Color.fromARGB(102, 255, 255, 255),
                    width: 1,
                    style: BorderStyle.solid,
                  )),
                  borderRadius: BorderRadius.all(Radius.circular(16.5)),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16.5)),
                      ),
                      margin: EdgeInsets.only(left: 3.5),
                      child: Image.asset(
                        "assets/images/test_question.png",
                        fit: BoxFit.none,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 6, bottom: 2),
                      child: Text(
                        currentQuestion.toString().padLeft(2, '0'),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: "Futura",
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 1),
                      child: Text(
                          "/" + totalQuestion.toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: "Futura",
                            fontWeight: FontWeight.w500,
                            fontSize: 8,
                          ),
                        ),
                    )
                  ],
                )
              ),
            
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 35, top: 3),
                child: Text(
                  "QUESTION. ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: "Futura",
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.6,
                    fontSize: 11.5,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  currentQuestion.toString().padLeft(2, '0'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: "Futura",
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
      ],
    );
  }

  Widget questionLine(String questionText){
    return Row(
      children: <Widget>[
        // SizedBox(width: 35,),
        Container(
          margin: EdgeInsets.only(left:5, top: 7),
          width: 315,
          child: Text(
            questionText,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: "Noto Sans CJK KR",
              fontWeight: FontWeight.w700,
              wordSpacing: 1,
              fontSize: 24,
            ),
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: (){
            if(choosenIndex==0){
              showDialog(
                context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    shape: RoundedRectangleBorder( 
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: Text("답변을 입력해 주세요\n",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,                      
                              fontFamily: "Futura",
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.2,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: ()=>Navigator.of(context).pop(),
                          child: Container(
                            height: 48,
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
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ),
                        ),
                      ],
                    )
                  );
              });
            }
            else if(currentQuestionIndex == totalQuestionIndex){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>TestEndViewWidget()));
            }
            else{
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>TestQuestionViewWidget(currentQuestionIndex + 1,totalQuestionIndex, questions[currentQuestionIndex])));
            }
            
            
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 18),
                child: Icon(Icons.arrow_forward, color: Colors.white, size: 20)
              ),
              Container(
                margin: EdgeInsets.only(top: 8, right: 18),
                child: Text(
                  "다음",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: "Futura",
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          )
        )
      ],
    );
  }

  Widget answerOptions(){
    

    Widget answerOptionTile(int optionIndex, String optionText){
      return GestureDetector(
        onTap: (){
          setState(() {
            choosenIndex = optionIndex;
          });
        },
        child: Container(
          margin: EdgeInsets.only(right: 22, left: 22, top: 12),
          height: 53,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 23, right: 23, bottom: 1),
                child: Text(
                  optionIndex.toString(),
                  style: TextStyle(
                    color: Color.fromARGB(255, 71, 90, 239),
                    fontFamily: "Futura",
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
              ),
              Text(
              optionText,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "Noto Sans CJK KR",
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(right: 13),
                width: 28,
                height: 28,
                child: optionIndex==choosenIndex?
                  Image.asset(
                    "assets/images/test_check_on.png",
                    fit: BoxFit.none,
                  ):
                  Image.asset(
                    "assets/images/test_check_off.png",
                    fit: BoxFit.none,
                  )
              )
            ],
          )
        )
      );
    }

    return Container(
      margin: EdgeInsets.only(bottom: 65),
      child: Column(
        children: <Widget>[
          answerOptionTile(1, "매우 그렇다"),
          answerOptionTile(2, "그렇다"),
          answerOptionTile(3, "보통이다"),
          answerOptionTile(4, "아니다"),
          answerOptionTile(5, "매우 아니다"),
        ],
      )
    );
  }



  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 71, 90, 239),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 93),
            questionNumber(currentQuestionIndex, totalQuestionIndex),
            questionLine(questionText),
            Spacer(),
            answerOptions(),
          ],
        )
      ),
    );
  }



}

