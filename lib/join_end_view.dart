import 'package:flutter/material.dart';

class JoinEndViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final nextButton = GestureDetector(
      onTap: () {
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
                    colors: [
                      Color.fromARGB(255, 53, 207, 187),
                      Color.fromARGB(255, 71, 90, 239),
                    ]
                  ),
                ),
                child: Container(),
              ),
            ),
            Positioned(
              top: 24,
              child: Text("확인", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold))
            ),
          ],
        ),
      ),
    );


    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Container()),
              Container(
                width: double.infinity,
                height: 40,
                margin: EdgeInsets.only(left:30, right:30),
                child: Text(
                  "가입이 완료되었습니다.", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: EdgeInsets.only(left:30, right:30, top: 20),
                child: Text(
                  "이메일 인증을 위한 메일이 발송되었습니다.\n인증이 완료되면 서비스를 이용하실 수 있습니다.", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF939AC2),
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              Container(
                // width: double.infinity,
                height: 90,
                margin: EdgeInsets.only(left:30, right:30, top: 50),
                child: Image.asset(
                  "assets/images/mail_box.png",
                  fit: BoxFit.fitHeight
                )
              ),
              Container(
                width: double.infinity,
                // height: 40,
                margin: EdgeInsets.only(left:40, right:40, top: 50),
                child: Text(
                  "* 인증 메일은 발송 시점으로부터 1시간동안만 효하며, 재발송 시 기존 인증코드는 만료됩니다. 반드시 마지막에 수신된 메일을 확인 바랍니다.\n\n* 메일이 도착하지 않았다면 스팸함을 확인해 주시기 바랍니다.", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFC4C4C4),
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              Expanded(child: Container()),
              Container(
                width: MediaQuery.of(context).size.width,
                // height: 100,
                margin: EdgeInsets.only(bottom: 1),
                child: nextButton
              ),
            ],
          ),
        ),
      ),
    );
  }
}