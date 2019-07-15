import 'package:flutter/material.dart';
import 'package:flutter_app/main1page/EachView.dart';

/// 自定义的底部菜单栏
class BottomAppBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BottomAppBarDemoState();
  }
}

class BottomAppBarDemoState extends State<BottomAppBarDemo> {
  List<Widget> pageList = new List<Widget>();
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageList..add(new EachView("HOME PAGE"))..add(new EachView("BUS PAGE"));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: pageList[_index],
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return new EachView("我是特殊界面");
          }));
        },
        tooltip: '我是特殊按钮',
        child: new Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: new BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                setState(() {
                  _index = 0;
                });
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.airport_shuttle),
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
