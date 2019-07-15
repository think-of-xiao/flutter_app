import 'package:flutter/material.dart';

import 'my_home_page.dart';

void main() => runApp(new StartApp());

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "保持页面状态",
      theme: ThemeData(primarySwatch: Colors.green),
      home: KeepAliveDemo(),
    );
  }
}

class KeepAliveDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return KeepAliveDemoState();
  }
}

/*
  with是dart的关键字，意思是混入的意思，
  就是说可以将一个或者多个类的功能添加到自己的类无需继承这些类，
  避免多重继承导致的问题。
  SingleTickerProviderStateMixin 主要是我们初始化TabController时，
  需要用到vsync ，垂直属性，然后传递this
*/
class KeepAliveDemoState extends State<KeepAliveDemo>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// 初始化tabController
    _controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    /// 界面被释放的时候，tabController也释放掉
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("保持页面状态"),
        bottom: TabBar(
            controller: _controller,
            indicatorColor: Colors.black87,
            tabs: [
              Tab(
                icon: Icon(Icons.directions_car),
                text: "小车",
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
                text: "火车",
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
                text: "自行车",
              )
            ]),
      ),
      body: TabBarView(
        children: <Widget>[
          MyHomePage(true),
          MyHomePage(false),
          MyHomePage(true)
        ],
        controller: _controller,
      ),
    );
  }
}
