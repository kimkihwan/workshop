import 'package:flutter/material.dart';
import 'fadecircle.dart';


class JoinEmailViewWidget extends StatefulWidget {
  @override
  _JoinEmailViewWidgetState createState() => _JoinEmailViewWidgetState();
}

class _JoinEmailViewWidgetState extends State<JoinEmailViewWidget>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  "메일 인증 대기 중입니다.", 
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
                  "인증이 완료되면 서비스를 이용하실 수 있습니다.\n메일로 이동하여 이메일 인증을 완료해주세요.", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF939AC2),
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
              Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.only(left:30, right:30, top: 50),
                child: SpinKitFadingCircle(
                  size: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                // height: 40,
                margin: EdgeInsets.only(left:40, right:40, top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "인증 메일을 수신하지 못하셨나요?", 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFC4C4C4),
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "  재발송",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF4F57FF),
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    )
                  ],
                )
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}