import 'package:flutter/material.dart';
import 'package:flutter_app/publicInfos/MyToastUtils.dart';
import 'package:flutter_app/publicInfos/Strings.dart';

void main() => runApp(new Demo13StatelessWidget());

class Demo13StatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: Strings.welcomeMessage + "-demo13",
      theme: new ThemeData(primaryColor: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: new Demo13StatefulWidget(),
    );
  }
}

class Demo13StatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Demo13State();
  }
}

class Demo13State extends State<Demo13StatefulWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    // TODO: implement initState
    controller = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(Strings.welcomeMessage + " this is demo13"),
        centerTitle: true,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            new RaisedButton.icon(
                onPressed: () {
                  MyToastUtils.showToastInBottom("i am click RaisedButton", 0);
                },
                icon: new Icon(Icons.airplanemode_active),
                label: new Text("i am RaisedButton")),
            new Container(
                margin: EdgeInsets.only(top: 15.0),
                child: new GestureDetector(
                  onTap: () { // 用户点击了控件
                    MyToastUtils.showToastInBottom("双击我会旋转哟~~", 1);
                  },
                  onLongPress: (){
                    // 用户长按了控件
                  },
                  onTapDown: (events){
                    // 用户按下时的动作
                  },
                  onTapUp: (events){
                    // 用户松开时的动作
                  },
                  onTapCancel: (){
                    // tap事件消失时动作
                  },
                  onVerticalDragStart: (events){
                    // 垂直拖动时的动作
                  },
                  onVerticalDragUpdate: (events){
                    // 垂直拖动位置更新时的动作
                  },
                  onVerticalDragEnd: (events){
                    // 垂直拖拽结束时的动作
                  },
                  onDoubleTap: () { // 用户快速连续两次在同一位置轻敲屏幕.
                    if(controller.isCompleted){ // 动画完成就从结束的位置往回动，回到初始位置
                      controller.reverse();
                    }else{
                      controller.forward(); // 开始动画
                    }
                  },
                  child: new RotationTransition( // 在需要旋转的widget外套一个旋转动画类容器
                    turns: curve, // 指定动画属性
                    child: new FlutterLogo(
                      style: FlutterLogoStyle.markOnly,
                      colors: Colors.brown,
                      size: 100.0,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
