import 'package:marquee/marquee.dart';
import 'package:flutter/material.dart';


class JoinCheckViewWidget extends StatefulWidget {
  @override
  _JoinCheckViewWidgetState createState() => _JoinCheckViewWidgetState();
}

class _JoinCheckViewWidgetState extends State<JoinCheckViewWidget> {

  void detail_text(int order) {
    if (order == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailText(1)),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailText(0)),
      );
    }
  }

  void check_function() {
    if (!_first_check && !_second_check && !_third_check && !_final_check) {
      _final_check = false;
      _all_check = false;
    }
    else if (!_first_check && !_second_check && !_third_check) {
      _final_check = false;
    }
  }
  
  bool _all_check = true;
  bool _first_check = true;
  bool _second_check = true;
  bool _third_check = true;
  bool _last_check = true;
  bool _final_check = true;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Text("약관 동의", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.close, color: Color(0xFF4F57FF)), onPressed: () {},)
        ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(
                            color: Color.fromARGB(255, 151, 151, 151),
                            width: 1,
                            style: BorderStyle.solid,
                          )),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: EdgeInsets.only(left: 35, top: 41, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left:10),
                      width: 30,
                      child: _all_check
                            ? FloatingActionButton(
                                elevation: 0.0,
                                backgroundColor: Color(0xFF444964),
                                child:Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _all_check = false;
                                    _first_check = false;
                                    _second_check = false;
                                    _third_check = false;
                                    _last_check = false;
                                    _final_check = false;
                                  });
                                },
                              )
                            : FloatingActionButton(
                                elevation: 0.0,
                                backgroundColor: Color(0xFF35D0BA),
                                child:Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _all_check = true;
                                    _first_check = true;
                                    _second_check = true;
                                    _third_check = true;
                                    _last_check = true;
                                    _final_check = true;
                                  });
                                },
                              )
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.all(13),
                        child: Text(
                          "이용약관 전체 동의",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Noto Sans CJK KR",
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 35, top: 33),
                child: Text(
                  "필수 동의항목",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 53, 208, 186),
                    fontFamily: "Noto Sans CJK KR",
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 28,
                margin: EdgeInsets.only(left: 30, top: 15, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 40,
                      child: _first_check
                      ? FlatButton(
                          child:Icon(
                            Icons.check,
                            size: 20.0,
                            color: Color(0xff444964),
                          ),
                          onPressed: () {
                            setState(() {
                              _first_check = false;
                            });
                            check_function();
                          },
                        )
                      : FlatButton(
                          child:Icon(
                            Icons.check,
                            size: 20.0,
                            color: Color(0xff35D0BA),
                          ),
                          onPressed: () {
                            setState(() {
                              _first_check = true;
                              _all_check = true;
                              _final_check = true;
                            });
                          },
                        )
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "서비스 이용약관 동의",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Noto Sans CJK KR",
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 40,
                      child: FlatButton(
                        onPressed: () => detail_text(1), 
                        child: Icon(Icons.arrow_right, color: Color(0xFF939AC2),))
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 28,
                margin: EdgeInsets.only(left: 30, top: 15, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 40,
                      child: _second_check
                      ? FlatButton(
                          child:Icon(
                            Icons.check,
                            size: 20.0,
                            color: Color(0xff444964),
                          ),
                          onPressed: () {
                            setState(() {
                              _second_check = false;
                            });
                            check_function();
                          },
                        )
                      : FlatButton(
                          child:Icon(
                            Icons.check,
                            size: 20.0,
                            color: Color(0xff35D0BA),
                          ),
                          onPressed: () {
                            setState(() {
                              _second_check = true;
                              _all_check = true;
                              _final_check = true;
                            });
                          },
                        )
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "개인정보 수집 및 이용에 대한 동의",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Noto Sans CJK KR",
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 40,
                      child: FlatButton(
                        onPressed: () => detail_text(1),
                        child: Icon(Icons.arrow_right, color: Color(0xFF939AC2),))
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 28,
                margin: EdgeInsets.only(left: 30, top: 15, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 40,
                      child: _third_check
                      ? FlatButton(
                          child:Icon(
                            Icons.check,
                            size: 20.0,
                            color: Color(0xff444964),
                          ),
                          onPressed: () {
                            setState(() {
                              _third_check = false;
                            });
                            check_function();
                          },
                        )
                      : FlatButton(
                          child:Icon(
                            Icons.check,
                            size: 20.0,
                            color: Color(0xff35D0BA),
                          ),
                          onPressed: () {
                            setState(() {
                              _third_check = true;
                              _all_check = true;
                              _final_check = true;
                            });
                          },
                        )
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "초상권 수집 및 이용에 대한 동의",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Noto Sans CJK KR",
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 40,
                      child: FlatButton(
                        onPressed: () => detail_text(1),
                        child: Icon(Icons.arrow_right, color: Color(0xFF939AC2),))
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 35, top: 18),
                child: Text(
                  "선택 동의항목",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 53, 208, 186),
                    fontFamily: "Noto Sans CJK KR",
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 28,
                margin: EdgeInsets.only(left: 30, top: 15, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 40,
                      child: _last_check
                      ? FlatButton(
                          child:Icon(
                            Icons.check,
                            size: 20.0,
                            color: Color(0xff444964),
                          ),
                          onPressed: () {
                            setState(() {
                              _last_check = false;
                            });
                            check_function();
                          },
                        )
                      : FlatButton(
                          child:Icon(
                            Icons.check,
                            size: 20.0,
                            color: Color(0xff35D0BA),
                          ),
                          onPressed: () {
                            setState(() {
                              _last_check = true;
                              _all_check = true;
                            });
                          },
                        )
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "프로모션 알림 메일 수신",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Noto Sans CJK KR",
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 40,
                      child: FlatButton(
                        onPressed: () => detail_text(1), 
                        child: Icon(Icons.arrow_right, color: Color(0xFF939AC2),))
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 56,
                height: 8,
                margin: EdgeInsets.only(bottom: 40),
                child: Image.asset(
                  "assets/images/first_join.png",
                  fit: BoxFit.none,
                ),
              ),
            ),
            Container(
              height: 60,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [
                            0.22727,
                            0.77273,
                          ],
                          colors: _final_check? 
                          [
                            Color(0xff444964),
                            Color(0xff444964),
                          ] :
                          [
                            Color.fromARGB(255, 53, 208, 186),
                            Color.fromARGB(255, 71, 90, 239),
                          ],
                        )
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Text(
                      "다음",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: _final_check? Color(0xFF1F2232) : Colors.white,
                        fontFamily: "Noto Sans CJK KR",
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailText extends StatelessWidget {
  final int order;

  DetailText(this.order);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Color(0xFF35D0BA)),
        title: Text("약관 설명서", style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        child: order==1
          ? SingleChildScrollView(
              padding: EdgeInsets.all(35),
              child: Column(
                children: <Widget>[
                  Text(
                    "서비스 이용약관 동의\n",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 53, 208, 186),
                      fontFamily: "Noto Sans CJK KR",
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  Text("본 약관은 이벤트 서비스의 이용과 관련하여 이벤트 서비스를 제공하는 따뜻한메이커연구소 주식회사 (이하 ‘당사’)와 이를 이용하는 이벤트 서비스 회원(이하 ‘회원’)과의 관계를 설명합니다.\n\n이벤트 서비스를 이용하시거나 이벤트 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.\n\n당사는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 회원으로 가입을 하셔야만 이벤트 서비스를 이용할 수 있습니다. 여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 당사는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 이벤트 서비스 이용 계정(이하 ‘계정’)을 부여합니다.\n계정이란 회원이 이벤트 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다.\n\n본 약관은 이벤트 서비스의 이용과 관련하여 이벤트 서비스를 제공하는 따뜻한메이커연구소 주식회사 (이하 ‘당사’)와 이를 이용하는 이벤트 서비스 회원(이하 ‘회원’)과의 관계를 설명합니다.\n\n이벤트 서비스를 이용하시거나 이벤트 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.\n\n당사는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 회원으로 가입을 하셔야만 이벤트 서비스를 이용할 수 있습니다.\n\n여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 당사는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 이벤트 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 이벤트 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다.",
                    style: TextStyle(color: Colors.white),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.stretch,
              )
              
            ) : Text("")
      )
    );
  }
}