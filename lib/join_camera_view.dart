import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class JoinCameraViewWidget extends StatefulWidget {
  @override
  _JoinCameraViewWidgetState createState() => _JoinCameraViewWidgetState();
}

class _JoinCameraViewWidgetState extends State<JoinCameraViewWidget> {

  bool isInput = true;

  final appBar = AppBar(
    iconTheme: IconThemeData(color: Color(0xFF35D0BA)),
    actions: <Widget>[
      IconButton(icon: Icon(Icons.close, color:Color(0xFF4F57FF)), onPressed: (){})
    ],
    centerTitle: true,
    title: Text("얼굴 등록", style: TextStyle(color: Colors.white)),
    backgroundColor: Colors.black,
  );

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
    final nextButton = GestureDetector(
      onTap: getImage,
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
              child: Text("확인", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold))
            ),
          ],
        ),
      ),
    );

    final afterButton = Row(
      children: <Widget>[
        GestureDetector(
          onTap: getImage,
          child: 
          Container(
            width: MediaQuery.of(context).size.width*0.38,
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
                    color: Color(0xFF444964),
                    child: Container(),
                  ),
                ),
                Positioned(
                  top: 24,
                  child: Text("재촬영", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold))
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            
          },
          child: 
          Container(
            width: MediaQuery.of(context).size.width*0.62,
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
                  child: Text("확인", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold))
                ),
              ],
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
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
                margin: EdgeInsets.only(left:30, right:30),
                child: Text(
                  "본인 확인을 위해", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left:30, right:30, top: 15),
                child: Text(
                  "얼굴 사진을 등록합니다.", 
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
                height: _image == null ? 112 : 300.0,
                margin: EdgeInsets.only(left:30, right:30, top: 50),
                child: Image.asset(
                  _image == null ? "assets/images/join_avatar.png" : _image,
                  fit: BoxFit.fitHeight
                )
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left:30, right:30, top: 50),
                child: Text(
                  "얼굴 사진은 수업에서 본인 확인용으로만 사용됩니다.\n휴대폰에 등록되어 있는 사진도 사용 가능합니다.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF939AC2),
                    fontSize: 15,
                  )
                ),
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
                child: _image == null? nextButton : afterButton
              ),
            ],
          ),
        ),
      )
    );
  }
}