import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class TaskUploadViewWidget extends StatefulWidget {
  @override
  _TaskUploadViewWidgetState createState() => _TaskUploadViewWidgetState();
}

class _TaskUploadViewWidgetState extends State<TaskUploadViewWidget> {
  bool isInput = false;
  int textlength = 0;

  File _data;

  Future _awaitReturnValue(BuildContext context) async {

    // start the SecondScreen and wait for it to finish with a result
    _data = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UploadTypeViewWidget(),
        ));

    // after the SecondScreen result comes back update the Text widget with it
    // if(mounted) {
    //   setState(() {
    //     _data = result;
    //     print(_data);
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Color(0xFF000000)),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
        title: Text("과제 등록", style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          FlatButton(
            onPressed: isInput?(){print("ok");}:null, 
            child: Text("등록", style: TextStyle(color: Colors.blue),)
            )
        ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 400,
                height: 40,
                margin: EdgeInsets.only(left: 11, top: 0, right: 11),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 400,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 237, 237, 237),
                        ),
                        child: Container()
                      ),
                    ),
                    Positioned(
                      left: 21,
                      top: 9,
                      child: Text(
                        "[DAY 01] 3차 과제 제출_5조_마법생태계",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 139, 139, 139),
                          fontFamily: "Noto Sans CJK KR",
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 400,
                    height: 190,
                    margin: EdgeInsets.only(left: 11, top: 13, right: 11),
                    decoration: BoxDecoration(
                                      border: Border.fromBorderSide(BorderSide(
                                                color: Color.fromARGB(255, 151, 151, 151),
                                                width: 1,
                                                style: BorderStyle.solid,
                                              )),
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 370,
                            height: 200,
                            margin: EdgeInsets.only(left:10),
                            child: TextField(
                              maxLines: 7,
                              maxLength: 1000,
                              onChanged: (string) {
                                if (string.length > 1) {
                                  isInput = true;
                                  textlength = string.length;
                                }
                                else {
                                  isInput = false;
                                  textlength = 0;
                                }
                              },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '내용',
                            ),
                          ),  
                          )
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 400,
                    height: 120,
                    margin: EdgeInsets.only(left: 11, top: 12, right: 11),
                    decoration: BoxDecoration(
                                      border: Border.fromBorderSide(BorderSide(
                                                color: Color.fromARGB(255, 151, 151, 151),
                                                width: 1,
                                                style: BorderStyle.solid,
                                              )),
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          _awaitReturnValue(context);
                        },
                        child: Container(
                        width: 150,
                        height: 100,
                        child: Image.asset(
                          "assets/images/upload_group.png",
                          fit: BoxFit.none,
                        ),
                      ),
                      )
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 400,
                      height: 71,
                      margin: EdgeInsets.only(left: 11, top: 12, right: 11),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 80,
                              height: 100,
                              margin: EdgeInsets.only(right: 5),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 1,
                                    child: Container(
                                      width: 71,
                                      height: 71,
                                      decoration: BoxDecoration(
                                        border: Border.fromBorderSide(BorderSide(
                                                  color: Color.fromARGB(255, 151, 151, 151),
                                                  width: 1.5,
                                                  style: BorderStyle.solid,
                                                )),
                                        borderRadius: BorderRadius.all(Radius.circular(3.25)),
                                      ),
                                      child:  _data == null?
                                      Container():
                                      Image.file(
                                        _data,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  // Positioned(
                                  //   left: 30,
                                  //   top: 70,
                                  //   child: Text(
                                  //     "(197.2KB)",
                                  //     textAlign: TextAlign.left,
                                  //     style: TextStyle(
                                  //       color: Color.fromARGB(255, 170, 170, 170),
                                  //       fontFamily: "Noto Sans CJK KR",
                                  //       fontWeight: FontWeight.w400,
                                  //       fontSize: 8,
                                  //     ),
                                  //   ),
                                  // ),
                                  Positioned(
                                    left: 55,
                                    top: 0,
                                    child: Image.asset(
                                      "assets/images/x_rec.png",
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                  Positioned(
                                    left: 60,
                                    top: 5,
                                    child: Image.asset(
                                      "assets/images/x_icon.png",
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.only(left: 11, right: 10, top: 20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 218, 218, 218),
                    ),
                    child: Container(),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}

class UploadTypeViewWidget extends StatefulWidget {
  @override
  _UploadTypeViewWidgetState createState() => _UploadTypeViewWidgetState();
}

class _UploadTypeViewWidgetState extends State<UploadTypeViewWidget> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if(mounted) {
      setState(() {
        _image = image;
      });
    }
  }

  Future getCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  void _sendDataBackImage(BuildContext context) {
    Navigator.pop(context, _image);
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [
              0.08803,
              0.81197,
            ],
            colors: [
              Color.fromARGB(255, 53, 208, 186),
              Color.fromARGB(255, 71, 90, 239),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 14,
                height: 14,
                margin: EdgeInsets.only(top: 60, right: 45),
                child: FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  color: Color.fromARGB(0, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                  textColor: Color.fromARGB(255, 0, 0, 0),
                  padding: EdgeInsets.all(0),
                  child: Icon(Icons.close,color: Colors.white)
                ),
              ),
            ),
            Container(
              width: 220,
              height: 68,
              margin: EdgeInsets.only(left: 70, top: 130),
              child: Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      getCamera();
                      _sendDataBackImage(context);
                    }, 
                    child: Image.asset(
                      "assets/images/camera.png",
                      fit: BoxFit.none,
                    ),
                  ),                  
                  Spacer(),
                  FlatButton(
                    onPressed: () {
                      getImage();
                      _sendDataBackImage(context);
                    }, 
                    child: Image.asset(
                      "assets/images/photo.png",
                      fit: BoxFit.none,
                    ),
                  ),  
                ],
              )
            ),
            Container(
              width: 220,
              height: 66,
              margin: EdgeInsets.only(left: 70, top: 44),
              child: Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {}, 
                    child: Image.asset(
                      "assets/images/video.png",
                      fit: BoxFit.none,
                    ),
                  ),                  
                  Spacer(),
                  FlatButton(
                    onPressed: () {}, 
                    child: Image.asset(
                      "assets/images/voice.png",
                      fit: BoxFit.none,
                    ),
                  ),  
                ],
              )
            ),
            Container(
              width: 91,
              height: 68,
              margin: EdgeInsets.only(left: 70, top: 43),
              child: FlatButton(
                onPressed: () {}, 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 40,
                      child: Image.asset(
                        "assets/images/file_icon.png",
                        fit: BoxFit.none,
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 13,
                      margin: EdgeInsets.only(left: 13, right: 14, bottom: 1),
                      child: Image.asset(
                        "assets/images/file_text.png",
                        fit: BoxFit.none,
                      ),
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
