import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {

  bool _isKeepAlive;

  MyHomePage(bool isKeepAlive){
    _isKeepAlive = isKeepAlive;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageState(_isKeepAlive);
  }
}

///混入AutomaticKeepAliveClientMixin，这是保持状态的关键
///然后重写wantKeppAlive 的值为true。
class MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
  int _counter = 0; // 做测试的数字
  bool _isKeepAlive; // 通过外部控制本界面是否保持原有的数据状态

  MyHomePageState(bool isKeepAlive){
    this._isKeepAlive = isKeepAlive;
  }

  /// 重写的一个变量，用来控制是否开启保持页面状态，这里置为true开启
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => _isKeepAlive;

  //声明一个内部方法，用来点击按钮后增加数量
  void _addCounterNum() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Text("点一下+1，点一下+1"), Text("$_counter")],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addCounterNum();
        },
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}
