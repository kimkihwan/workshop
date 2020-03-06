import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';


class JoinFirstView extends StatefulWidget {
  @override
  _JoinFirstViewState createState() => _JoinFirstViewState();
}

class _JoinFirstViewState extends State<JoinFirstView> {

  String _passwordValue;

  final _formKey = GlobalKey<FormState>();

  final passwordValidator = MultiValidator([  
    RequiredValidator(errorText: '비밀번호를 입력해주세요.'),  
    MinLengthValidator(5, errorText: '6자 이상, 영문 소문자/숫자 조합을 사용해주세요. 특수문자 사용불가'),  
    PatternValidator(r'^[a-z]+[0-9]+$', errorText: '6자 이상, 영문 소문자/숫자 조합을 사용해주세요. 특수문자 사용불가'),
  ]);

  final appBar = AppBar(
    iconTheme: IconThemeData(color: Color(0xFF35D0BA)),
    actions: <Widget>[
      IconButton(icon: Icon(Icons.close, color:Color(0xFF4F57FF)), onPressed: (){})
    ],
    centerTitle: true,
    title: Text("회원가입", style: TextStyle(color: Colors.white)),
    backgroundColor: Colors.black,
  );

  final emailInput = TextFormField(
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(left:20),
      hintText: '이메일',
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 2.0),
        borderRadius: BorderRadius.circular(30),
      ),
      fillColor: Color(0xFF35D0BA),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF35D0BA), width: 2.0),
        borderRadius: BorderRadius.circular(30),
      ),
      suffixIcon: Container(
        width: 70,
        height: 30,
        margin: EdgeInsets.only(top:10, bottom:10, right:10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 79, 87, 255),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Center(
          child: Text("중복확인", 
            style: TextStyle(
              color:Colors.white,
              fontSize: 11
            ),
            textAlign: TextAlign.center,
          ),
        )
      ),
    ),
  );

  TextFormField inputPassword(String hintText, Function validator) {
    return TextFormField(
      onChanged: (val) => _passwordValue = val,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left:20),
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        errorStyle: TextStyle(
          fontSize: 10
        ),
        fillColor: Color(0xFF35D0BA),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF35D0BA), width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      obscureText: false, 
      validator: validator
    );
  }

  TextField inputText(String hintText, bool obscure) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left:20),
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        fillColor: Color(0xFF35D0BA),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF35D0BA), width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  bool isInput = true;

  @override
  Widget build(BuildContext context) {
    
    final nextButton = GestureDetector(
      onTap: () {
        _formKey.currentState.validate();
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
                    colors: isInput? [
                      Color.fromARGB(255, 53, 207, 187),
                      Color.fromARGB(255, 71, 90, 239),
                    ] : [
                      Color(0xFF444964),
                      Color(0xFF444964)
                    ],
                  ),
                ),
                child: Container(),
              ),
            ),
            Positioned(
              top: 24,
              child: Text("다음", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold))
            ),
          ],
        ),
      ),
    );


    var _pageSize = MediaQuery.of(context).size.height;
    var _notifySize = MediaQuery.of(context).padding.top;
    var _appBarSize = appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          height: _pageSize - (_appBarSize + _notifySize),
          // constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                margin: EdgeInsets.only(left: 35, top: 41, right: 20),
                child: Text("기본정보", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color:Color(0xFF4F57FF)),)
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: EdgeInsets.only(left: 35, top: 10, right: 20),
                child: emailInput
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                margin: EdgeInsets.only(left: 35, top: 5, right: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      inputPassword("비밀번호", passwordValidator),
                      SizedBox(height:10),
                      inputPassword("비밀번호 확인", (val) => MatchValidator(errorText: '비밀번호가 서로 다릅니다.').validateMatch(val, _passwordValue)),
                    ],
                  ) 
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: EdgeInsets.only(left: 35, top: 20, right: 20),
                child: inputText("이름", false)
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: EdgeInsets.only(left: 35, top: 0, right: 20),
                child: inputText("휴대전화", false)
              ),
              Expanded(child: Container()),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: EdgeInsets.only(left: 35, top: 0, right: 20),
                child: Image.asset(
                  "assets/images/first_join.png"
                )
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