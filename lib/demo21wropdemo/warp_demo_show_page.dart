import 'package:flutter/material.dart';

class WarpDemoShowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WarpState();
  }
}

class WarpState extends State<WarpDemoShowPage> {
  List<Widget> dataList; // 声明一个

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataList = List<Widget>()..add(buildAndButton());
  }

  @override
  Widget build(BuildContext context) {
    // 得到屏幕的宽度和高度，用来设置Container的宽和高
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局 WarpLayout"),
      ),
      backgroundColor: Colors.teal,
      body: Center(
        child: Opacity(
          opacity: 0.8,
          alwaysIncludeSemantics: true,
          child: Container(
              width: width,
              height: height / 2,
              color: Colors.grey,
              child: SingleChildScrollView(
                child: Wrap(
                  // 流式布局Wrap
                  children: dataList, // 数据体
                  spacing: 26.0, // item之间的边距
                ),
              )),
        ),
      ),
    );
  }

  Widget buildAndButton() {
    // 返回一个
    return GestureDetector(
      onTap: () {
        if (dataList.length < 15) {
          setState(() {
            dataList.insert(dataList.length - 1, buildPhoto(80.0, 80.0));
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black45,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto(double itemWidth, double itemHeight) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: itemWidth,
        height: itemHeight,
        color: Colors.amber,
        child: Center(
          child: Text("照片"),
        ),
      ),
    );
  }
}
