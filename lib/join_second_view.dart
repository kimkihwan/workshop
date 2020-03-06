import 'package:flutter/material.dart';


class JoinSecondView extends StatefulWidget {
  @override
  _JoinSecondViewState createState() => _JoinSecondViewState();
}

class _JoinSecondViewState extends State<JoinSecondView> {

  var _groupList = [
    'SK 이노베이션',
    'SK 텔레콤',
    'SK E&S',
    'SK 하이닉스',
    'SK 케미칼',
    'SK 네트웍스',
    'SKC',
    'SK 에너지',
    'SK 종합화학',
    'SK 루브리컨츠',
    'SK 건설',
    'SK 가스',
    'SK 브로드밴드',
    'SK 머티리얼즈',
    'SK 실트론',
    'SK 주식회사'
  ];

  final _formKey = GlobalKey<FormState>();

  String _dropdownValue;

  final appBar = AppBar(
    iconTheme: IconThemeData(color: Color(0xFF35D0BA)),
    actions: <Widget>[
      IconButton(icon: Icon(Icons.close, color:Color(0xFF4F57FF)), onPressed: (){})
    ],
    centerTitle: true,
    title: Text("회원가입", style: TextStyle(color: Colors.white)),
    backgroundColor: Colors.black,
  );

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
                height: 80,
                margin: EdgeInsets.only(left: 35, top: 10, right: 20),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left:20),
                      hintText: '기관 코드',
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
                          child: Text("인증하기", 
                            style: TextStyle(
                              color:Colors.white,
                              fontSize: 11
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return '계열사 선택을 위해서는 기관 코드 인증이 반드시 필요합니다.';
                      }
                    },
                  ),
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: EdgeInsets.only(left: 35, top: 0, right: 20),
                child: 
                FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left:20, right:15),
                        hintText: '계열사 선택',
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
                      // isEmpty: _dropdownValue == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          underline: Text(''),
                          // autofocus: true,
                          hint: Text('계열사 선택', style: TextStyle(color:Colors.grey),),
                          value: _dropdownValue,
                          // isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              _dropdownValue = newValue;
                              state.didChange(newValue);
                            });
                          },
                          items: _groupList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: EdgeInsets.only(left: 35, top: 0, right: 20),
                child: inputText("부서", false)
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: EdgeInsets.only(left: 35, top: 0, right: 20),
                child: inputText("직급", false)
              ),
              Expanded(child: Container()),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: EdgeInsets.only(left: 35, top: 0, right: 20),
                child: Image.asset(
                  "assets/images/second_join.png"
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
          )
        )
      )
    );
  }
}