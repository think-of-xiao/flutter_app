import 'package:flutter/material.dart';
import 'package:flutter_app/publicInfos/MyToastUtils.dart';
import 'package:flutter_app/publicInfos/Strings.dart';

void main() => runApp(new AppDemo14());

class AppDemo14 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: Strings.welcomeMessage,
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primaryColor: Colors.blueGrey),
      home: new Demo14StatefulWidget(),
    );
  }
}

class Demo14StatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Demo14State();
  }
}

class Demo14State extends State<Demo14StatefulWidget> {
  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(_listItemData(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(Strings.welcomeMessage + "13"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      primary: true,
      body: new ListView.builder(
          itemCount: widgets.length,
          itemBuilder: (BuildContext context, int position) {
            return _listItemData(position);
          }),
    );
  }

  Widget _listItemData(int i) {
    return new GestureDetector(
        onTap: () {
          setState(() {
            if (i == 0) {
              widgets.add(_listItemData(widgets.length + 1));
              MyToastUtils.showToastInBottom(
                  "${widgets[i].toString()}点击第0项我添加了一条数据,总条数${widgets.length}",
                  0);
            } else if (i % 2 == 0) {
              widgets.add(_listItemData(widgets.length + 1));
              MyToastUtils.showToastInBottom(
                  "${widgets[i]}我添加了一条数据,总条数${widgets.length}", 0);
            } else {
              widgets.remove(widgets[i]);
//              widgets[i] = null;
              MyToastUtils.showToastInBottom(
                  "$i我删除了一条数据,总条数${widgets.length}", 0);
            }
          });
        },
        child: new Center(
          child: new Padding(
            padding: new EdgeInsets.all(10.0),
            child: new Text(Strings.welcomeMessage + "${(i + 1)}"),
          ),
        ));
  }
}
