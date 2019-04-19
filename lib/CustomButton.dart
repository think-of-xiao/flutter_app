import 'package:flutter/material.dart';
void main() => runApp(new CustomWidget());
class CustomWidget extends StatelessWidget{
  Map<String, String> pop = {};
  @override
  Widget build(BuildContext context) {

    Widget _routesLayout(BuildContext context, String titleStr, String contentStr, String pushName){
      return new Scaffold(
        appBar: new AppBar(
          leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () async {pop = await Navigator.of(context).pushNamed(pushName);} // 点击图标返回上一个界面
          ),
          centerTitle: true,
          title: new Text(titleStr),
        ),
        body: new Center(
            child: new RaisedButton(
              onPressed: () async {
                if(contentStr.contains("haha1"))
                  Navigator.of(context).pushNamed("/d");
                else
                  Navigator.of(context).pop({"lat":3483748374, "long":8457938794});
                },
              child: new Text(contentStr + pop.toString()),
            )
        ),
      );
    }
    /// 各界面路由集合
    final Map<String, WidgetBuilder> _mRoutes = {
      '/a':(context) => _routesLayout(context, "wo shi a", "haha1", "/b"),
      '/b':(BuildContext context) => _routesLayout(context, "wo shi b", "haha2", "/c"),
      '/c':(BuildContext context) => _routesLayout(context, "wo shi c", "haha3", "/a"),
      '/d':(BuildContext context) => new CustomWidget()
    };

    // TODO: implement build
    return new MaterialApp(
      title: "wo shi custom widget",
      theme: new ThemeData(
        primaryColor: Colors.deepOrangeAccent
      ),
      home: new CustomWidgetStateful(),
      routes: _mRoutes, // 注册添加route路由，开启新界面
    );
  }
}
class CustomWidgetStateful extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CustomWidgetState("wo shi custom widget");
  }
}
class CustomWidgetState extends State<CustomWidgetStateful>{
  CustomWidgetState(this._titleStr);
  String _titleStr;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_titleStr),
      ),
      body: new Center(child: new CustomButton("wo shi nei rong"),),
    );
  }
}
/// 自定义按钮
class CustomButton extends StatelessWidget{
  final String _contentStr;
  CustomButton(this._contentStr);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RaisedButton(onPressed: (){Navigator.of(context).popAndPushNamed("/a");}, child: new Text(_contentStr),);
  }
}