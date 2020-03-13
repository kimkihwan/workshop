import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io' as io;
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workshop/task_view/record_video.dart';
import 'package:workshop/task_view/task_board.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';
import 'package:workshop/task_view/video_play.dart';
import 'package:workshop/task_view/voice_record.dart';


enum ConfirmAction { CANCEL, ACCEPT }
enum RecordAction { START, STOP }
 

List<CameraDescription> cameras;

Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        content: const Text(
            '선택한 파일을 삭제하시겠습니까?\n삭제하면 목록에서 사라집니다.', textAlign: TextAlign.center,),
        actions: <Widget>[
          FlatButton(
            child: const Text('아니오'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          FlatButton(
            child: const Text('예', style: TextStyle(color: Colors.red)),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
            },
          )
        ],
      );
    },
  );
}

class TaskUploadViewWidget extends StatefulWidget {
  final LocalFileSystem localFileSystem;

  TaskUploadViewWidget({localFileSystem}) : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  @override
  _TaskUploadViewWidgetState createState() => _TaskUploadViewWidgetState();
}

class _TaskUploadViewWidgetState extends State<TaskUploadViewWidget> {
  bool isInput = false;
  bool _isRecording = false;
  var recorder;
  int textlength = 0;
  int type;
  AudioPlayer audioPlayer = AudioPlayer();

  File _data;
  String name;
  
  Future _awaitReturnValue(BuildContext context) async {

    // start the SecondScreen and wait for it to finish with a result
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UploadTypeViewWidget(),
      )
    );
    print(result);
    if (result == 1) {
      getCamera();
    } else if(result == 2){
      getImage();
    } else if(result == 3){
      getVideo();
    } else {
      getVoice();
    }
    setState(() {
      type = result;
    });
  }

  Future getVideo() async {
    cameras = await availableCameras();
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraHomeScreen(cameras),
      )
    );
    
    setState(() {
      _data = result;
    });
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _data = image;
      name = _data.path.split("/").last;
    });
  }

  Future getCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _data = image;
    });
  }

  getVoice() async {
    // return showDialog<ConfirmAction>(
    //   context: context,
    //   barrierDismissible: false, // user must tap button for close dialog!
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       content: const Text(
    //           '녹음을 시작하려면 시작을 눌러주세요.', textAlign: TextAlign.center,),
    //       actions: <Widget>[
    //         FlatButton(
    //           child: Text('정지', style: TextStyle(color: Colors.white)),
    //           onPressed: () {
    //             if(_isRecording) {
    //               _stop();
    //               Navigator.of(context).pop();
    //             }
    //           },
    //         ),
    //         FlatButton(
    //           child: _isRecording ? Text('녹음중', style: TextStyle(color: Colors.red)):Text('시작', style: TextStyle(color: Colors.red)),
    //           onPressed: _isRecording ? null : _start,
    //         )
    //       ],
    //     );
    //   },
    // );
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VoiceRecordWidget(),
      )
    );
    setState(() {
      _data = result;
    });
  }

  _start() async {
    try {
      if (await FlutterAudioRecorder.hasPermissions) {
        io.Directory appDocDirectory =
                await getApplicationDocumentsDirectory();
        String path = appDocDirectory.path + '/' + 'record_voice' + '${Random().nextInt(1000)}';
        print("Start recording: $path");
         // .wav .aac .m4a
        recorder = FlutterAudioRecorder(path);
        await recorder.initialized;
        await recorder.start();
        bool isRecording = true;
        setState(() {
          _isRecording = isRecording;
        });
      } else {
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text("마이크 권한이 필요합니다.")));
      }
    } catch (e) {
      print(e);
    }
  }

  _stop() async {
    var result = await recorder.stop();
    File file = widget.localFileSystem.file(result.path);
    setState(() {
      _isRecording = false;
      _data = file;
    });
  }


  Widget dataView() {
    if (type == 1) {
      // getCamera();
      return Image.file(_data, fit:BoxFit.fill);
    } else if(type == 2){
      // getImage();
      return Image.file(_data, fit:BoxFit.fill);
    } else if(type == 3){
      // getVideo();
      return Icon(Icons.videocam, color: Colors.black);
    } else {
      // getVoice();
      // playLocal();
      return Icon(Icons.mic, color: Colors.black);
    }
  }

  Widget dataName() {
    var filename;
    if (type == 1) {
      // getCamera();
      filename = name;
    } else if(type == 2){
      // getImage();
      filename = name;
    } else if(type == 3){
      // getVideo();
      filename = "Video";
    } else {
      // getVoice();
      // playLocal();
      filename = "Voice";
    }
    return Text(
      "$filename",
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Color.fromARGB(255, 170, 170, 170),
        fontFamily: "Noto Sans CJK KR",
        fontWeight: FontWeight.w400,
        fontSize: 8,
      ),
    );
  }
  // playLocal() async {
  //   await audioPlayer.play(_data.path, isLocal: true);
  // }

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
            onPressed: () {
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => TaskBoardViewWidget())
              );
            },
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
                              style: TextStyle(color: Colors.black),
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
                      height: 120,
                      margin: EdgeInsets.only(left: 11, top: 12, right: 11),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: _data == null?
                            Container():
                            Container(
                              width: 150,
                              height: 100,
                              margin: EdgeInsets.only(right: 5),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 1,
                                    child: GestureDetector(
                                      onTap: () {
                                        print("asd");
                                        if (type == 1) {
                                          // getCamera();
                                        } else if(type == 2){
                                          // getImage();
                                        } else if(type == 3){
                                          // getVideo();
                                        } else {
                                          // getVoice();
                                          // playLocal();
                                        }
                                      },
                                      child: Container(
                                        width: 71,
                                        height: 71,
                                        decoration: BoxDecoration(
                                          border: Border.fromBorderSide(BorderSide(
                                                    color: Color.fromARGB(255, 151, 151, 151),
                                                    width: 2,
                                                    style: BorderStyle.solid,
                                                  )),
                                          borderRadius: BorderRadius.all(Radius.circular(3.25)),
                                        ),
                                        child:  _data == null?
                                        Container():
                                        dataView()
                                      ),
                                    )
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 75,
                                    child: dataName()
                                  ),
                                  Positioned(
                                    left: 55,
                                    top: 2,
                                    child: GestureDetector(
                                      onTap: () async {
                                        final ConfirmAction action = await _asyncConfirmDialog(context);
                                        setState(() {
                                          if(action == ConfirmAction.ACCEPT)
                                            _data = null;
                                        });
                                      },
                                      child: Image.asset(
                                        "assets/images/x_rec.png",
                                        fit: BoxFit.none,
                                      ),
                                    )
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
                    margin: EdgeInsets.only(left: 11, right: 10),
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

  void _sendDataBackImage(BuildContext context, int type) {
    Navigator.pop(context, type);
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
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
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      _sendDataBackImage(context, 1);
                    }, 
                    child: Image.asset(
                      "assets/images/camera.png",
                      fit: BoxFit.none,
                    ),
                  ),                  
                  SizedBox(width:20),
                  FlatButton(
                    onPressed: () {
                      _sendDataBackImage(context, 2);
                    }, 
                    child: Image.asset(
                      "assets/images/photo.png",
                      fit: BoxFit.none,
                    ),
                  ),  
                ],
              )
            ),
            SizedBox(height:50),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      _sendDataBackImage(context, 3);
                    }, 
                    child: Image.asset(
                      "assets/images/video.png",
                      fit: BoxFit.none,
                    ),
                  ),                  
                  SizedBox(width:20),
                  FlatButton(
                    onPressed: () {
                      _sendDataBackImage(context, 4);
                    }, 
                    child: Image.asset(
                      "assets/images/voice.png",
                      fit: BoxFit.none,
                    ),
                  ),  
                ],
              )
            ),
            SizedBox(height:50),
            Align(
              alignment: Alignment.centerLeft,
              // width: 91,
              // height: 68,
              // margin: EdgeInsets.only(left: 70, top: 43),
              child: FlatButton(
                onPressed: () {
                  showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return new AlertDialog(
                      title: new Text('준비중'), 
                    );
                });
                }, 
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
                    SizedBox(height:10),
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
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
