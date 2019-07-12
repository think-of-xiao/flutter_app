import 'package:flutter/material.dart';
import 'package:flutter_app/mainpage/AirplayScreen.dart';
import 'package:flutter_app/mainpage/EmailScreen.dart';
import 'package:flutter_app/mainpage/HomeScreen.dart';
import 'package:flutter_app/mainpage/PageScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Flutter bottomNavigationBar",
      theme: ThemeData.light(),
      home: new BottomNavigationWidget(),
    );
  }
}

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BottomNavigationWidgetState();
  }
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> pageList = new List<Widget>();

  @override
  void initState() {
    // TODO: implement initState
    pageList
      ..add(new HomeScreen())
      ..add(new EmailScreen())
      ..add(new PageScreen())
      ..add(new AirplayScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: pageList[_currentIndex], // 加载指定界面
      bottomNavigationBar: new BottomNavigationBar(
          onTap: (index) {
            // 点击底部每项导航的监听，更新下标
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex, // 指定选定的下标
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.home,
                color: _bottomNavigationColor,
              ),
              title: new Text(
                'HOME',
                style: new TextStyle(color: _bottomNavigationColor),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.email,
                color: _bottomNavigationColor,
              ),
              title: new Text(
                'EMAIL',
                style: new TextStyle(color: _bottomNavigationColor),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.pages,
                color: _bottomNavigationColor,
              ),
              title: new Text(
                'PAGES',
                style: new TextStyle(color: _bottomNavigationColor),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.airplay,
                color: _bottomNavigationColor,
              ),
              title: new Text(
                'AIRPLAY',
                style: new TextStyle(color: _bottomNavigationColor),
              ),
            )
          ]),
    );
  }
}
