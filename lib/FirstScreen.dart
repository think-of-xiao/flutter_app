import 'package:flutter/material.dart';
import 'package:flutter_app/bean/Product.dart';
import 'package:flutter_app/publicInfos/MyToastUtils.dart';

/// 页面跳转并返回数据demo
void main() => runApp(new MaterialApp(
      title: '导航demo1',
      debugShowCheckedModeBanner: true,
      theme: new ThemeData(primaryColor: Colors.teal),
      home: new FirstScreen(),
    ));

class FirstScreen extends StatelessWidget {
  List<Product> dataList;
  String _string;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    dataList = List.generate(20, (i) => Product('商品 $i', '这是一个商品详情，编号为:$i'));
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('导航demo1'),
      ),
      body: new Center(
        child: new ListView(
          padding: EdgeInsets.all(15.0),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            new RaisedButton(
              onPressed: () async {
                await poshToAnotherPageFun(context, '0');
              },
              child: new Text('查看商品详情页面0'),
            ),
            new RaisedButton(
              onPressed: () async {
                await poshToAnotherPageFun(context, '1');
              },
              child: new Text('查看商品列表'),
            )
          ],
        ),
      ),
    );
  }

  Future poshToAnotherPageFun(BuildContext context, String indexStr) async {
    String msg;
    msg = await Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new SecondScreen(indexStr, dataList)))
        as String;
    if (msg != null && msg.isNotEmpty) {
      _string = msg;
      MyToastUtils.showToastInBottom(_string, 0);
//      Scaffold.of(context).showSnackBar(SnackBar(content: Text(_string)));
    }
  }
}

class SecondScreen extends StatelessWidget {
  String _string;
  List<Product> dataList;

  SecondScreen(this._string, this.dataList);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('商品详情页$_string'),
      ),
      body: contentWidget(context, _string),
    );
  }

  Widget contentWidget(BuildContext context, String itemClickIndex) {
    switch (itemClickIndex) {
      case '0':
        return Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context, "我是返回来的数据$_string");
            },
            child: Text('返回'),
          ),
        );
      case '1':
        return Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.pop(context, dataList[index].title);
                },
                leading: Image.asset('assets/fx_mingxi.png'),
                title: Text(dataList[index].title),
                subtitle: Text(dataList[index].description),
              );
            },
            itemCount: dataList.length,
          ),
        );
    }
    return null;
  }
}
