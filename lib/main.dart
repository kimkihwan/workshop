import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:workshop/join.dart';
import 'package:workshop/login.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI WorkShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'WorkShop Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontSize: 17.0);

  @override
  Widget build(BuildContext context) {

    final logoText = Text("준비물까지 챙겨주는\n온라인 클래스", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center);

    final joinText = FlatButton(
      child: Text("아직 계정이 없으신가요?", style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => JoinPage()));
      },
    );

    final loginButon = Material(
      elevation: 0.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Color(0xFFFEA42F),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        height: 65,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: Text("로그인",
            textAlign: TextAlign.center,
            style: style.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold)
        )
      ),
    );

    return Scaffold(
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
                SizedBox(height: 150.0),
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 15.0),
                logoText,
                SizedBox(height: 150.0),
                loginButon,
                SizedBox(height: 60.0),
                joinText
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





