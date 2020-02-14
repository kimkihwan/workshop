import 'package:flutter/material.dart';
<<<<<<< HEAD
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
=======
import 'package:workshop/lecture.dart';
import 'package:workshop/join.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextStyle style = TextStyle(fontSize: 17.0);
  bool isInput = false;

  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "이메일",
          border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC4C4C4)))
      )
    );

    final passwordField = TextField(
      onChanged: (string) {
        setState(() {
          if (string.length > 4)
            isInput = true;
          else {
            isInput = false;
          }
        });
      },
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "비밀번호",
          border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC4C4C4)))
      )
    );

    final joinText = FlatButton(
      child: Text("아직 계정이 없으신가요?", style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => JoinPage()));
      },
    );

    final loginButon = Material(
      elevation: 0.0,
      borderRadius: BorderRadius.circular(5.0),
      color: isInput? Color(0xFFFEA42F) : Colors.grey,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        height: 65,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: isInput? () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LectureMain()),
          );
        } : null,
        child: Text("로그인",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text("로그인", style: TextStyle(color:Colors.black, fontSize: 18)),
        backgroundColor: Color(0xFFF2F2F2),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
      child: Center(
        child: Container(
          color: Color(0xFFF2F2F2),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30.0),
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 10.0),
                passwordField,
                SizedBox(height: 40.0),
                joinText,
                SizedBox(height: 40.0),
                loginButon,
                SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ),
      ),
      backgroundColor: Color(0xFFF2F2F2),
    );
  }
}

>>>>>>> 4a41f34c5ae4e8051ae5e20b84787d7ce15401e8
