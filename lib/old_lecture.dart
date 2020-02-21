import 'package:workshop/pin/pin_put.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:workshop/old_lec_detail.dart';

class LectureMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bool lec = true;
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Text("강의", style: TextStyle(color:Colors.black, fontSize: 18,)),
              backgroundColor: Color(0xFFF2F2F2),
              elevation: 0.0,
            ),
            body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children:[
                      Column(
                        children: <Widget>[
                          DottedBorder(
                        padding: EdgeInsets.all(4),
                        dashPattern: [9, 5],
                        color: Color(0xFFC4C4C4),
                        child: 
                        Container(
                          height: 82,
                          width: 320,
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                          ),
                          child:
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Container(
                                  width: 28,
                                  height: 40,
                                  child: FloatingActionButton(
                                    child: Icon(Icons.add, size: 14),         
                                    elevation: 0.0,
                                    backgroundColor: Color(0xFF10C971),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => LecturePin()),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 20,
                                  child: Center(
                                    child: Text("강의 추가", style: TextStyle(color: Color(0xFF979797), fontSize: 12))
                                  )
                                ),
                              ]
                            )
                        ),
                      ),
                      SizedBox(height: 20,),
                      lec ?
                        OutlineButton(
                          child:
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/sk.png",
                                  fit: BoxFit.contain,
                                ),
                                // SizedBox(width: 20,),
                                Column(
                                  children: <Widget>[
                                    SizedBox(height: 15,),
                                    Text("      SK그룹 AI 입문 과정\n      AI-Workshop", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                    SizedBox(height: 5,),
                                    Text("매직에코, 최재규 대표", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),)
                                  ],
                                )
                              ],
                            ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailLec()),
                            );
                          }
                      ) : Center(),
                      ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        child: RaisedButton(
                          textColor: Color(0xFF979797),
                          child: Text('다음', style: TextStyle(fontSize: 14)),
                          color: Color(0xFFDADADA),
                          onPressed: () {},
                        ),
                      )
                    ],
                    
                  )
                ),
                  backgroundColor: Color(0xFFF2F2F2),
              )
         );
 }
}

class LecturePin extends StatefulWidget {
  LecturePin({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Pinstate createState() => _Pinstate();
}

class _Pinstate extends State<LecturePin> {

  TextStyle style = TextStyle(fontSize: 17.0);
  bool isInput = false;

  @override
  Widget build(BuildContext context) {

    final joinButton = Material(
      elevation: 0.0,
      borderRadius: BorderRadius.circular(5.0),
      color: isInput ? Color(0xFFFEA42F): Colors.grey,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        height: 65,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: isInput ? () {
          Navigator.pop(context);
        } : null,
        child: Text("참여하기",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
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
                color: Colors.black
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
            title: Text("강의 찾기", style: TextStyle(color:Colors.black, fontSize: 18,)),
            backgroundColor: Color(0xFFF2F2F2),
            elevation: 0.0,
          ),
          backgroundColor: Color(0xFFF2F2F2),
          body: Builder(
            builder: (context) => Padding(
                padding: const EdgeInsets.all(40.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(height: 50.0),
                      PinPut(
                        fieldsCount: 8,
                        onSubmit: (String pin) => _changeButton(pin),
                      ),
                      SizedBox(height: 40.0),
                      Row(
                        children: <Widget>[
                          Text('강의 코드', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          Text('를 입력해주세요.', style: TextStyle(fontSize: 12)),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                      SizedBox(height: 40.0),
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