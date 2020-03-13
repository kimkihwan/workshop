import 'package:flutter/material.dart';
import 'package:workshop/join_view/join_camera_view.dart';
import 'user.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;


class JoinSecondView extends StatefulWidget {
  User person;
  JoinSecondView({person}) : this.person = person ?? User();
  @override
  _JoinSecondViewState createState() => _JoinSecondViewState();
}

class _JoinSecondViewState extends State<JoinSecondView> {

  @override
  void initState() {
    print(widget.person.name);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isCheck = false;

  var _groupList = [
    ''
  ];

  final _formKey = GlobalKey<FormState>();

  String _code;

  String _sub;

  String _dept;

  String _position;

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
      onChanged: hintText=='부서'?(val)=>_dept=val:(val)=>_position=val,
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

  _makePostRequest() async {
    // set up POST request arguments
    String url = 'https://withai.10make.com/api/company';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"company_code": "$_code"}';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    if (statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var check = jsonResponse['error'];
      if (check == 'NC') {
        isCheck = false;
        showDialog(
          context: context,
          barrierDismissible: false, // user must tap button for close dialog!
          builder: (BuildContext context) {
            return AlertDialog(
              content: const Text(
                  '회사 코드가 존재하지 않습니다.', textAlign: TextAlign.center,),
              actions: <Widget>[
                FlatButton(
                  child: Text('확인', style: TextStyle(color: Colors.white)),
                  onPressed: () => Navigator.of(context).pop()
                )
              ],
            );
          },
        );
      }
      else {
        isCheck = true;
        for(Map<String, dynamic> i in jsonResponse['subs']) {
          _groupList.add(i['sub_name']);
        }
        _groupList.remove('');
        showDialog(
          context: context,
          barrierDismissible: false, // user must tap button for close dialog!
          builder: (BuildContext context) {
            return AlertDialog(
              content: const Text(
                  '인증되었습니다.', textAlign: TextAlign.center,),
              actions: <Widget>[
                FlatButton(
                  child: Text('확인', style: TextStyle(color: Colors.white)),
                  onPressed: () => Navigator.of(context).pop()
                )
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final nextButton = GestureDetector(
      onTap: () {
        if (_formKey.currentState.validate()) {
          widget.person.dept = _dept;
          widget.person.sub = _sub;
          widget.person.position = _position;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JoinCameraViewWidget(person: widget.person)),
          );
        }
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
                height: 375,
                margin: EdgeInsets.only(left: 35, top: 10, right: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        onChanged: (val) => _code = val,
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
                          suffixIcon: GestureDetector(
                            onTap: _makePostRequest,
                            child: Container(
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
                          )
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return '계열사 선택을 위해서는 기관 코드 인증이 반드시 필요합니다.';
                          }
                        },
                      ),
                      SizedBox(height:10),
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
                            isEmpty: _sub == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                underline: Text(''),
                                // autofocus: true,
                                hint: Text('계열사 선택', style: TextStyle(color:Colors.grey),),
                                value: _sub,
                                // isDense: true,
                                onChanged: (String newValue) {
                                  setState(() {
                                    _sub = newValue;
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
                      ),
                      SizedBox(height:10),
                      inputText("부서", false),
                      SizedBox(height:10),
                      inputText("직급", false)
                    ],
                  ),
                )
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