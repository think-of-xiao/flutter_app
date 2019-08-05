import 'package:flutter/material.dart';
import 'package:flutter_app/demo28dio/http.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController mController = TextEditingController();

  /// 请求后显示的文字
  String showText = '欢迎你来到美好人间';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美好人间'),
      ),
      body: Container(
        height: 1000.0,
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              autofocus: false,
              controller: mController,
              decoration: InputDecoration(
                  labelText: '美女类型',
                  helperText: '请输入你喜欢的类型',
                  contentPadding: EdgeInsets.all(10.0)),
            ),
            RaisedButton.icon(
                onPressed: _choiceAction,
                icon: Icon(Icons.all_inclusive),
                label: Text('选择完毕')),
            Text(
              showText,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }

  /// 点击按钮请求接口
  _choiceAction() {
    print('开始选择你喜欢的类型..............');
    if (mController.text.toString() == '') {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: Text('美女类型不能为空'),
              ));
    } else {
      AppHttp.getHttp(mController.text.toString()).then((val) {
        setState(() {
          showText = val['data']['name'].toString();
        });
      });
    }
  }
}
