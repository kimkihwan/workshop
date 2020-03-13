
import 'package:flutter/material.dart';
import 'package:workshop/values/values.dart';


class NotiViewWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF35D0BA)),
        centerTitle: true,
        title: Text("공지 게시판", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
              },
              child:
              Container(
                height: 75,
                margin: EdgeInsets.only(left: 15, top: 0, right: 35),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      child: Column(children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 15, right: 200),
                            child: Text(
                              "20.01.01",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "Apple SD Gothic Neo",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 1, top: 4),
                            child: Text(
                              "카카오톡 장애로 불편을 드려 죄송합니다.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Apple SD Gothic Neo",
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],)
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 5,
                        height: 8,
                        child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15,)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.only(left: 0, top: 0, right: 0),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
              ),
              child: Container(),
            ),
            GestureDetector(
              onTap: () {
              },
              child:
              Container(
                height: 75,
                margin: EdgeInsets.only(left: 15, top: 0, right: 35),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      child: Column(children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 15, right: 200),
                            child: Text(
                              "20.01.01",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.secondaryText,
                                fontFamily: "Apple SD Gothic Neo",
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 1, top: 4),
                            child: Text(
                              "카카오톡 장애로 불편을 드려 죄송합니다.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Apple SD Gothic Neo",
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],)
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 5,
                        height: 8,
                        child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15,)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.only(left: 0, top: 0, right: 0),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
              ),
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}