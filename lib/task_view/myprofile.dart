import 'package:flutter/material.dart';
import 'package:workshop/values/colors.dart';

class ProfileWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF35D0BA)),
        centerTitle: true,
        title: Text("내 정보", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton(
            onPressed: () {
            },
            child: Text("편집"),
          )
        ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          children: [
            Align(
              // alignment: Alignment.center,
              child: Container(
                width: 69,
                height: 67,
                margin: EdgeInsets.only(top: 20),
                child: Stack(
                  // alignment: Alignment.center,
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
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 21, top: 22),
                child: Text(
                  "기본 정보",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.accentText,
                    fontFamily: "Apple SD Gothic Neo",
                    fontWeight: FontWeight.w700,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 300,
                height: 15,
                margin: EdgeInsets.only(left: 31, top: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "이메일",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Apple SD Gothic Neo",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 38),
                        child: Text(
                          "gksrlgusz@magice.co",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontFamily: "Apple SD Gothic Neo",
                            fontWeight: FontWeight.w700,
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
              margin: EdgeInsets.only(left: 20, top: 11, right: 20),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
              ),
              child: Container(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 300,
                height: 15,
                margin: EdgeInsets.only(left: 31, top: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "이름",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Apple SD Gothic Neo",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 49),
                        child: Text(
                          "한기현",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontFamily: "Apple SD Gothic Neo",
                            fontWeight: FontWeight.w700,
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
              margin: EdgeInsets.only(left: 20, top: 11, right: 20),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
              ),
              child: Container(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 300,
                height: 15,
                margin: EdgeInsets.only(left: 31, top: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "전화번호",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Apple SD Gothic Neo",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 28),
                        child: Text(
                          "010 - 1234 - 5678",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontFamily: "Apple SD Gothic Neo",
                            fontWeight: FontWeight.w700,
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
              margin: EdgeInsets.only(left: 20, top: 11, right: 20),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
              ),
              child: Container(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 21, top: 22),
                child: Text(
                  "추가 정보",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.accentText,
                    fontFamily: "Apple SD Gothic Neo",
                    fontWeight: FontWeight.w700,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 300,
                height: 15,
                margin: EdgeInsets.only(left: 31, top: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "계열사",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Apple SD Gothic Neo",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 36),
                        child: Text(
                          "SK텔레콤",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontFamily: "Apple SD Gothic Neo",
                            fontWeight: FontWeight.w700,
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
              margin: EdgeInsets.only(left: 20, top: 11, right: 20),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
              ),
              child: Container(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 300,
                height: 15,
                margin: EdgeInsets.only(left: 31, top: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "부서",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Apple SD Gothic Neo",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 47),
                        child: Text(
                          "소프트웨어 엔지니어",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontFamily: "Apple SD Gothic Neo",
                            fontWeight: FontWeight.w700,
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
              margin: EdgeInsets.only(left: 20, top: 11, right: 20),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
              ),
              child: Container(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 300,
                height: 15,
                margin: EdgeInsets.only(left: 31, top: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "직급",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontFamily: "Apple SD Gothic Neo",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 47),
                        child: Text(
                          "팀 리더",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.secondaryText,
                            fontFamily: "Apple SD Gothic Neo",
                            fontWeight: FontWeight.w700,
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
              margin: EdgeInsets.only(left: 20, top: 11, right: 20),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
              ),
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}