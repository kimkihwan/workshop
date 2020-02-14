import 'package:flutter/material.dart';
import 'package:workshop/lecture_code.dart';


class LectureMain extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Image.asset(
                              "assets/images/path-24.png",
                              fit: BoxFit.none,
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 4,
                            child: Image.asset(
                              "assets/images/path-2.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ],
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LectureCode()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF4F57FF),
      ),
    );
  }
}