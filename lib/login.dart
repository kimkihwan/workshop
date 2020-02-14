import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workshop/values/values.dart';
import 'package:workshop/login_page.dart';

class LoginMain extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
       statusBarColor: Colors.white,
    ));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Container(
              width: 139,
              height: 36,
              margin: EdgeInsets.only(left: 40, top: 39),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 75,
                      height: 36,
                      child: Image.asset(
                        "assets/images/shape-51.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 60,
                      height: 33,
                      margin: EdgeInsets.only(left: 3, top: 3),
                      child: Image.asset(
                        "assets/images/shape-95.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 131,
              height: 33,
              margin: EdgeInsets.only(left: 41, top: 11),
              child: Text("준비물까지 준비해주는\n온라인 클래스", style: TextStyle(color: Color(0xFF939AC2)),)
            ),
            Spacer(),
            Align(
              alignment: Alignment.topCenter,
              child: 
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                },
                  child: 
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 58,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 350),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
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
                                ],
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Container()
                          ),
                        ),
                        Positioned(
                          top: 24,
                          child: Text("로그인", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                        ),
                      ],
                    ),
                  )   
                )           
            ),
            Align(
              alignment: Alignment.topCenter,
              child: 
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child:
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 58,
                  margin: EdgeInsets.only(top: 13, left: 20, right: 20),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        right: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 58,
                          decoration: BoxDecoration(
                            border: Border.fromBorderSide(Borders.secondaryBorder),
                            borderRadius: BorderRadius.all(Radius.circular(29)),
                          ),
                          child: Container(),
                        ),
                      ),
                      Positioned(
                        top: 23,
                        child: Image.asset(
                          "assets/images/shape-39.png",
                          fit: BoxFit.none,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              
            ),
            Spacer(),
            Container(
              width: 102,
              height: 12,
              margin: EdgeInsets.only(left: 20, bottom: 100),
              child: Image.asset(
                "assets/images/shape-12.png",
                fit: BoxFit.none,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}