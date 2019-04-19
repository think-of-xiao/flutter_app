import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/publicInfos/MyToastUtils.dart';
import 'package:flutter_app/publicInfos/Strings.dart';

void main() => runApp(new Demo12());

class Demo12 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: Strings.welcomeMessage + "->demo 12",
      theme: new ThemeData(
        primaryColor: Colors.teal
      ),
      home: new LifecycleWatcher(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class LifecycleWatcher extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LifecycleWatcherState();
  }
}
class _LifecycleWatcherState extends State<LifecycleWatcher> with WidgetsBindingObserver{

  AppLifecycleState _lastLifecycleState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    setState(() {
      _lastLifecycleState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(_lastLifecycleState == null)
      return new Scaffold(floatingActionButton: new FloatingActionButton(onPressed: (){MyToastUtils.showToastInCenter("this is toast", 1);}, child: new Icon(Icons.adjust),),
          body: new Center(child: new Text("This widget has not observed any lifecycle changes.", textDirection: TextDirection.ltr,),));
    else
      return new Scaffold(floatingActionButton: new FloatingActionButton(onPressed: (){MyToastUtils.showToastInCenter("this is toast", 0);}, child: new Icon(Icons.wifi_tethering),),
          body: new Center(child: new Text('The most recent lifecycle state this widget observed was: $_lastLifecycleState.',
          textDirection: TextDirection.ltr)));
  }
}