import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workshop/old_lecture.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class JoinPage extends StatefulWidget {
  JoinPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _JoinPage createState() => _JoinPage();
}

class _JoinPage extends State<JoinPage> {

  bool isFinish = false;

  @override
  Widget build(BuildContext context) {
    
    final sizestyle = TextStyle(fontSize: 12.0);

    final mainText = Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text("   기본정보", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      ),
    );

    final emailField = TextField(
      style: sizestyle,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
        hintText: "이메일",
        border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC4C4C4)))
      )
    );

    final passwordField = TextField(
      obscureText: true,
      style: sizestyle,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
        hintText: "비밀번호",
        border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC4C4C4)))
      )
    );
    
    final passwordFieldAgain = TextField(
      obscureText: true,
      style: sizestyle,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
        hintText: "비밀번호 확인",
        border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC4C4C4)))
      )
    );

    final nameField = TextField(
      style: sizestyle,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
        hintText: "이름",
        border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC4C4C4)))
      )
    );

    final numberField = TextField(
      style: sizestyle,
      onChanged: (s) {
        setState(() {
          if (s.length > 10) {
            isFinish = true;
          }
          else {
            isFinish = false;
          }
        });
      },
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
        hintText: "휴대전화",
        border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC4C4C4)))
      )
    );

    return Scaffold(
      // resizeToAvoidBottomInset: false, 
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text("회원가입", style: TextStyle(color:Colors.black, fontSize: 18)),
        backgroundColor: Color(0xFFF2F2F2),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [               
                  mainText,
                  emailField,
                  passwordField,
                  passwordFieldAgain,
                  SizedBox(height: 20.0),
                  nameField,
                  numberField,
                ]
              ),
            ),
          ),        
          SizedBox(height: 100),
          Container(
            child:
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 10.0,
                width: 10.0,
                child: FittedBox(
                  child: FloatingActionButton(
                    heroTag: "btn1",
                    backgroundColor: Color(0xFFFEA42F),
                    elevation: 0.0,
                    onPressed: null,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 10.0,
                width: 10.0,
                child: FittedBox(
                  child: FloatingActionButton(
                    heroTag: "btn2",
                    backgroundColor: Color(0xFFDADADA),
                    elevation: 0.0,
                    onPressed: null,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 10.0,
                width: 10.0,
                child: FittedBox(
                  child: FloatingActionButton(
                    heroTag: "btn3",
                    backgroundColor: Color(0xFFDADADA),
                    elevation: 0.0,
                    onPressed: null,
                  ),
                ),
              )
            ],
          ),
          ),
          SizedBox(height: 100),
          Container(
            margin: EdgeInsets.only(bottom: 0.0),
            width: double.infinity,
            height: 60,
            child: RaisedButton(
              textColor: Colors.white,
              child: Text('다음', style: TextStyle(fontSize: 14)),
              color: isFinish? Color(0xFFFEA42F) : Color(0xFF979797),
              onPressed: isFinish? () { Navigator.push(context, MaterialPageRoute(builder: (context) => JoinPageTwo()),
          );} : null,
            ),
          )
        ],
      )
      ),
      backgroundColor: Color(0xFFF2F2F2),
    );
  }
}

class JoinPageTwo extends StatefulWidget {
  JoinPageTwo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _JoinPageTwo createState() => _JoinPageTwo();
}

class _JoinPageTwo extends State<JoinPageTwo> {

  bool isFinish = false;

  @override
  Widget build(BuildContext context) {
    
    final sizestyle = TextStyle(fontSize: 12.0);

    final mainText = Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text("   추가정보", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      ),
    );

    final companyField = TextField(
      style: sizestyle,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
        hintText: "계열사",
        border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC4C4C4)))
      )
    );

    final teamField = TextField(
      obscureText: true,
      style: sizestyle,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
        hintText: "부서",
        border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC4C4C4)))
      )
    );
    
    final positionField = TextField(
      onChanged: (s) {
        setState(() {
          if (s.length > 1) {
            isFinish = true;
          }
          else {
            isFinish = false;
          }
        });
      },
      style: sizestyle,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
        hintText: "직급",
        border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFC4C4C4)))
      )
    );

    return Scaffold(
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
        title: Text("회원가입", style: TextStyle(color:Colors.black, fontSize: 18)),
        backgroundColor: Color(0xFFF2F2F2),
        elevation: 0.0,
      ),
      body: Center(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            color: Color(0xFFF2F2F2),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [               
                  mainText,
                  companyField,
                  teamField,
                  positionField,
                ]
              ),
            ),
          ),
          // SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 10.0,
                width: 10.0,
                child: FittedBox(
                  child: FloatingActionButton(
                    heroTag: "btn1",
                    backgroundColor: Color(0xFFDADADA),
                    elevation: 0.0,
                    onPressed: null,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 10.0,
                width: 10.0,
                child: FittedBox(
                  child: FloatingActionButton(
                    heroTag: "btn2",
                    backgroundColor: Color(0xFFFEA42F),
                    elevation: 0.0,
                    onPressed: null,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 10.0,
                width: 10.0,
                child: FittedBox(
                  child: FloatingActionButton(
                    heroTag: "btn3",
                    backgroundColor: Color(0xFFDADADA),
                    elevation: 0.0,
                    onPressed: null,
                  ),
                ),
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: RaisedButton(
              textColor: Colors.white,
              child: Text('다음', style: TextStyle(fontSize: 14)),
              color: isFinish? Color(0xFFFEA42F) : Color(0xFF979797),
              onPressed: isFinish? () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => JoinPageThree()));
              } : null,
            ),
          )
        ],
      )
      ),
      backgroundColor: Color(0xFFF2F2F2),
    );
  }
}

class JoinPageThree extends StatefulWidget {
  JoinPageThree({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _JoinPageThree createState() => _JoinPageThree();
}

class _JoinPageThree extends State<JoinPageThree> {

  bool isFinish = false;

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {

    final mainText = Text("얼굴 사진 추가", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15));

    final subText = Text("수업에서 사용될 본인 확인을 위해\n얼굴 사진을 등록합니다.", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15));

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
        title: Text("얼굴등록", style: TextStyle(color:Colors.black, fontSize: 18)),
        backgroundColor: Color(0xFFF2F2F2),
        elevation: 0.0,
      ),
      body: Center(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            color: Color(0xFFF2F2F2),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  mainText,
                  SizedBox(height: 20),
                  subText,
                  SizedBox(height: 30),
                  SizedBox(
                    height: _image == null ? 120.0 : 300.0,
                    child: _image == null ?
                    Image.asset(
                      "assets/smile.png",
                      fit: BoxFit.contain,
                    ) : Image.file(_image),
                  ),
                  SizedBox(height: 30),
                ]
              ),
            ),
          ),
          // SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 10.0,
                width: 10.0,
                child: FittedBox(
                  child: FloatingActionButton(
                    heroTag: "btn1",
                    backgroundColor: Color(0xFFDADADA),
                    elevation: 0.0,
                    onPressed: null,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 10.0,
                width: 10.0,
                child: FittedBox(
                  child: FloatingActionButton(
                    heroTag: "btn2",
                    backgroundColor: Color(0xFFDADADA),
                    elevation: 0.0,
                    onPressed: null,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 10.0,
                width: 10.0,
                child: FittedBox(
                  child: FloatingActionButton(
                    heroTag: "btn3",
                    backgroundColor: Color(0xFFFEA42F),
                    elevation: 0.0,
                    onPressed: null,
                  ),
                ),
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: RaisedButton(
              textColor: Colors.white,
              child: Text('확인', style: TextStyle(fontSize: 14)),
              color: Color(0xFFFEA42F),
              onPressed: getImage,
            ),
          )
        ],
      )
      ),
      backgroundColor: Color(0xFFF2F2F2),
    );
  }
}
