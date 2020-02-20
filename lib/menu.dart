import 'package:flutter/material.dart';
import 'package:workshop/values/colors.dart';
import 'package:workshop/myprofile.dart';

class MenuViewWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF35D0BA)),
        centerTitle: true,
        title: Text("메뉴", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          children: [
            Align(
              child: Container(
                width: 69,
                height: 67,
                margin: EdgeInsets.only(top: 20),
                child: 
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileWidget()),
                    );
                  },
                  child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 67,
                        height: 67,
                        decoration: BoxDecoration(
                          border: Border.fromBorderSide(BorderSide(
                                    color: Color.fromARGB(255, 79, 87, 255),
                                    width: 3,
                                    style: BorderStyle.solid,
                                  )),
                          borderRadius: BorderRadius.all(Radius.circular(33.5)),
                        ),
                        child: Container(),
                      ),
                    ),
                    Positioned(
                      top: 43,
                      right: 0,
                      child: Image.asset(
                        "assets/images/menu_round.png",
                        fit: BoxFit.none,
                      ),
                    ),
                    Positioned(
                      top: 51,
                      right: 4,
                      child: Image.asset(
                        "assets/images/menu_team.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ],
                  ),
                )
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(top: 30),
              child: Text("한기현_5조", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center)
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(top: 9),
              child: Text("gksrlgusz@magice.co", textAlign: TextAlign.center)
            ),
            Container(
              width: 160,
              height: 1,
              margin: EdgeInsets.only(top: 18),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
              ),
              child: Container(),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(top: 28),
              child: Text("팀 정보", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(top: 35),
              child: Text("공지 게시판", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(top: 35),
              child: Text("과제 게시판", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            ),
            Container(
              width: 160,
              height: 1,
              margin: EdgeInsets.only(top: 27),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
              ),
              child: Container(),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(top: 28),
              child: Text("강의 목록", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            ),
            Container(
              width: 160,
              height: 1,
              margin: EdgeInsets.only(top: 27),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
              ),
              child: Container(),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(top: 30, bottom: 42),
              child: Text("로그아웃", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            ),
            Container(
              width: 102,
              height: 12,
              child: Image.asset(
                "assets/images/2020magiceco.png",
                fit: BoxFit.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}