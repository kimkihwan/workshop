import 'package:flutter/material.dart';
import 'package:workshop/lecture_view/lecture_code.dart';
import 'package:workshop/lecture_view/lecture_detail.dart';


class LectureMain extends StatefulWidget {
  LectureMain({Key key, this.isAdd}) : super(key: key);

  bool isAdd;

  @override
  _LectureMainState createState() => _LectureMainState();
}

class _LectureMainState extends State<LectureMain> {

  Future _awaitReturnValue(BuildContext context) async {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LectureCode(),
      )
    );

   }
  @override
  Widget build(BuildContext context) {

    var lectureButton = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DailyViewWidget(),
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
                    "SK그룹 AI 입문과정", 
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  // SizedBox(height:10),
                  Text(
                    "AI-Workshop", 
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
                  child: Image.asset(
                    'assets/sk.png',
                    fit: BoxFit.fitHeight,
                  ),
                )
              ),
            ),
            )
          )
        )
      ],
    );

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
        child: widget.isAdd? lectureButton:emptyLecture
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _awaitReturnValue(context);
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xFF4F57FF),
      ),
    );
  }
}