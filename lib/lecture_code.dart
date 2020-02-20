import 'package:flutter/material.dart';
import 'package:workshop/lecture.dart';
import 'package:workshop/pin/pin_put.dart';
import 'package:workshop/lecture_detail.dart';

class LectureCode extends StatefulWidget {
  LectureCode({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Pinstate createState() => _Pinstate();
}

class _Pinstate extends State<LectureCode> {

  TextStyle style = TextStyle(fontSize: 17.0);
  bool isInput = false;

  @override
  Widget build(BuildContext context) {

    final joinButton = GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DaliyViewWidget()),
        );
      },
      child: 
      Container(
        width: double.infinity,
        height: 60,
        // margin: EdgeInsets.only(left: 20, top: 63, right: 20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 60,
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
                ),
                child: Container(),
              ),
            ),
            Positioned(
              top: 24,
              child: Text("참여하기", style: TextStyle(color: Colors.white))
            ),
          ],
        ),
      ),
    );

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFFEA42F),
        //hintColor: Color(0xFFFEA42F),
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
            title: Text("강의 찾기", style: TextStyle(color:Colors.white, fontSize: 18,)),
            backgroundColor: Colors.black,
            elevation: 0.0,
          ),
          backgroundColor: Colors.black,
          body: Builder(
            builder: (context) => Padding(
                padding: const EdgeInsets.all(40.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Spacer(),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text("강의 추가를 위해 수업에서 제공되는", style: TextStyle(color: Colors.white70, fontSize: 20)),
                              Text("강의 코드를 입력해주세요.", style: TextStyle(color: Colors.white, fontSize: 30)),
                            ]
                          )
                        ),
                      ),
                      Spacer(),
                      PinPut(
                        fieldsCount: 8,
                        onSubmit: (String pin) => _changeButton(pin),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Text("알파벳과 숫자가 조합된", style: TextStyle(color: Color(0xFF939AC2), fontSize: 18)),
                              Text("강의 코드 8자리를 입력해주세요.", style: TextStyle(color: Color(0xFF939AC2), fontSize: 18)),
                            ]
                          )
                        ),
                      ),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      joinButton,
                    ],
                  )
                ),
              ),
            )));
  }

  void _changeButton(String pin) {
      setState(() {
        isInput = true;
      });
  }
}