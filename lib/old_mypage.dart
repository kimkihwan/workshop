import 'package:flutter/material.dart';
import 'package:workshop/old_lecture.dart';

class BodyLayout extends StatefulWidget {
  @override
  BodyLayoutState createState() => BodyLayoutState();
}

class BodyLayoutState extends State<BodyLayout> {

  List<String> titles = ['Sun', 'Moon', 'Star'];

  @override
  Widget build(BuildContext context) {
    final titles = ['', '팀 정보', '공지사항', '', '강의목록', '', '도움말 및 지원', '로그아웃'];

      final icons = [Icons.directions_bike, Icons.directions_boat,
      Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
      Icons.directions_run, Icons.directions_subway, Icons.directions_transit,
      Icons.directions_walk];

      return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("메뉴", style: TextStyle(color: Colors.black)),
          backgroundColor: Color(0xFFF2F2F2),
        ),
        body: ListView.builder(
          itemCount: titles.length+1,
          itemBuilder: (context, index) {
            
            if (index == 0) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.jpeg'),
                  ),
                  title: Text('Sun'),
                  subtitle: Text('93 million miles away'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              );
            }
            else if (index == 1 || index == 4 || index == 6) {
              return Card();
            }
            else {
              return Card( //                           <-- Card widget
                child: ListTile(
                  leading: Icon(icons[index-1]),
                  title: Text(titles[index-1]),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LectureMain()),
                    );
                  },
                ),
              );
            }
          },
        ),
      );
  }

}