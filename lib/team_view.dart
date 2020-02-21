
import 'package:flutter/material.dart';
import 'package:workshop/values/values.dart';
import 'myprofile.dart';

class TeamViewWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF35D0BA)),
        centerTitle: true,
        title: Text("팀 정보", style: TextStyle(color: Colors.black)),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 140,
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 80,
                      height: 80,
                      margin: EdgeInsets.only(top: 8),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: AppColors.blueBackground,
                                borderRadius: BorderRadius.all(Radius.circular(40)),
                              ),
                              child: Container(),
                            ),
                          ),
                          Positioned(
                            left: 17,
                            top: 17,
                            child: Text("5조", textAlign: TextAlign.center, style: TextStyle(fontSize: 30, color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      width: 280,
                      height: 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              margin: EdgeInsets.only(right: 140),
                              child: Text(
                                "[5조] 마법생태계",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontFamily: "Apple SD Gothic Neo",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 300,
                              height: 1,
                              margin: EdgeInsets.only(top: 8),
                              decoration: BoxDecoration(
                                color: AppColors.primaryElement,
                              ),
                              child: Container(),
                            ),
                          ),
                          SizedBox(height:10),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                                "AI  오프라인 워크샵 웹/모바일 시나리오 산업 전반에 적용된 AI를 이해할 수 있다. 티처블머신을 이용해 AI 모델을 만들고 IoT기기에 적용할 수 있다. AI를 활용한 서비스 융합기획을 할 수 있다.",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.secondaryText,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 21, top: 0),
                child: Text(
                  "팀원 정보",
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileWidget()),
                );
              },
              child:
              Container(
              height: 75,
              margin: EdgeInsets.only(left: 31, top: 0, right: 35),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 44,
                      height: 44,
                      margin: EdgeInsets.only(top: 2),
                      decoration: BoxDecoration(
                        border: Border.fromBorderSide(Borders.leader_border),
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                      ),
                      child: Container(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 24,
                      height: 24,
                      margin: EdgeInsets.only(left: 17, top: 0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Image.asset(
                              "assets/images/leader_round.png",
                              fit: BoxFit.none,
                            ),
                          ),
                          Positioned(
                            left: 4,
                            top: 8,
                            child: Image.asset(
                              "assets/images/leader_text.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 100,
                      height: 75,
                      margin: EdgeInsets.only(left: 16, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "이정인",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "Apple SD Gothic Neo",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "팀 리더",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "Apple SD Gothic Neo",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                                Spacer(),
                              ],
                            )
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 100,
                              margin: EdgeInsets.only(left: 1, top: 2),
                              child: Text(
                                "소프트웨어 엔지니어",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.secondaryText,
                                  fontFamily: "Apple SD Gothic Neo",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 1, top: 4),
                              child: Text(
                                "SK텔레콤",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.secondaryText,
                                  fontFamily: "Apple SD Gothic Neo",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
              margin: EdgeInsets.only(left: 20, top: 0, right: 20),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
              ),
              child: Container(),
            ),
            Container(
              height: 75,
              margin: EdgeInsets.only(left: 31, top: 0, right: 35),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 44,
                      height: 44,
                      margin: EdgeInsets.only(top: 3),
                      decoration: BoxDecoration(
                        border: Border.fromBorderSide(Borders.member_border),
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                      ),
                      child: Container(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 24,
                      height: 24,
                      margin: EdgeInsets.only(left: 17, top: 0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Image.asset(
                              "assets/images/member_round.png",
                              fit: BoxFit.none,
                            ),
                          ),
                          Positioned(
                            left: 4,
                            top: 8,
                            child: Image.asset(
                              "assets/images/member_text.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 100,
                      height: 75,
                      margin: EdgeInsets.only(left: 16, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "이정인",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "Apple SD Gothic Neo",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "팀 리더",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "Apple SD Gothic Neo",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                                Spacer(),
                              ],
                            )
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 100,
                              margin: EdgeInsets.only(left: 1, top: 2),
                              child: Text(
                                "소프트웨어 엔지니어",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.secondaryText,
                                  fontFamily: "Apple SD Gothic Neo",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 1, top: 4),
                              child: Text(
                                "SK텔레콤",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.secondaryText,
                                  fontFamily: "Apple SD Gothic Neo",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
            Container(
              height: 1,
              margin: EdgeInsets.only(left: 20, top: 5, right: 20),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
              ),
              child: Container(),
            ),
            Container(
              height: 75,
              margin: EdgeInsets.only(left: 31, top: 0, right: 35),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 44,
                      height: 44,
                      margin: EdgeInsets.only(top: 3),
                      decoration: BoxDecoration(
                        border: Border.fromBorderSide(Borders.member_border),
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                      ),
                      child: Container(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 24,
                      height: 24,
                      margin: EdgeInsets.only(left: 17, top: 0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Image.asset(
                              "assets/images/member_round.png",
                              fit: BoxFit.none,
                            ),
                          ),
                          Positioned(
                            left: 4,
                            top: 8,
                            child: Image.asset(
                              "assets/images/member_text.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 100,
                      height: 75,
                      margin: EdgeInsets.only(left: 16, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "이정인",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "Apple SD Gothic Neo",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "팀 리더",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "Apple SD Gothic Neo",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                                Spacer(),
                              ],
                            )
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 100,
                              margin: EdgeInsets.only(left: 1, top: 2),
                              child: Text(
                                "소프트웨어 엔지니어",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.secondaryText,
                                  fontFamily: "Apple SD Gothic Neo",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 1, top: 4),
                              child: Text(
                                "SK텔레콤",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.secondaryText,
                                  fontFamily: "Apple SD Gothic Neo",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
            Container(
              height: 1,
              margin: EdgeInsets.only(left: 20, top: 5, right: 20),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
              ),
              child: Container(),
            ),
            Container(
              height: 75,
              margin: EdgeInsets.only(left: 31, top: 0, right: 35),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 44,
                      height: 44,
                      margin: EdgeInsets.only(top: 3),
                      decoration: BoxDecoration(
                        border: Border.fromBorderSide(Borders.member_border),
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                      ),
                      child: Container(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 24,
                      height: 24,
                      margin: EdgeInsets.only(left: 17, top: 0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Image.asset(
                              "assets/images/member_round.png",
                              fit: BoxFit.none,
                            ),
                          ),
                          Positioned(
                            left: 4,
                            top: 8,
                            child: Image.asset(
                              "assets/images/member_text.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 100,
                      height: 75,
                      margin: EdgeInsets.only(left: 16, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "이정인",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "Apple SD Gothic Neo",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "팀 리더",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                    fontFamily: "Apple SD Gothic Neo",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                                Spacer(),
                              ],
                            )
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 100,
                              margin: EdgeInsets.only(left: 1, top: 2),
                              child: Text(
                                "소프트웨어 엔지니어",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.secondaryText,
                                  fontFamily: "Apple SD Gothic Neo",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.only(left: 1, top: 4),
                              child: Text(
                                "SK텔레콤",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.secondaryText,
                                  fontFamily: "Apple SD Gothic Neo",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
            Container(
              height: 1,
              margin: EdgeInsets.only(left: 20, top: 5, right: 20),
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