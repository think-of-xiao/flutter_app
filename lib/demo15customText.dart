import 'package:flutter/material.dart';
import 'package:flutter_app/publicInfos/MyToastUtils.dart';
import 'package:flutter_app/publicInfos/Strings.dart';

void main() => runApp(new AppDemo15());

class AppDemo15 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: Strings.welcomeMessage + "o.o.demo15",
      theme: new ThemeData(primaryColor: Colors.lightGreen),
      debugShowCheckedModeBanner: true,
      home: new Demo15StatefulWidget(),
    );
  }
}

class Demo15StatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Demo15State();
  }
}

class Demo15State extends State<Demo15StatefulWidget> {
  String _errorStr;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '使用自定义字体子不',
          style: new TextStyle(fontFamily: 'familyFontStyle'),
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new Center(
              child: new Column(children: <Widget>[
            new Text(
              '\n关雎（先秦）\n'
                  '关关雎鸠，在河之洲。\n'
                  '窈窕淑女，君子好逑。\n'
                  '参差荇菜，左右流之。\n'
                  '窈窕淑女，寤寐求之。\n'
                  '求之不得，寤寐思服。\n'
                  '悠哉悠哉，辗转反侧。\n'
                  '参差荇菜，左右采之。\n'
                  '窈窕淑女，琴瑟友之。\n'
                  '参差荇菜，左右芼之。\n'
                  '窈窕淑女，钟鼓乐之。\n\n',
              style: new TextStyle(
                fontFamily: 'familyFontStyle',
                fontSize: 24.0,
              ),
            ),
            new TextField(
              keyboardType: TextInputType.phone,
              decoration: new InputDecoration(
                  helperText: '请填写真实手机号',
                  labelText: '输入您的手机号',
                  alignLabelWithHint: true,
                  contentPadding: new EdgeInsets.only(left: 15.0, right: 15.0)),
            ),
            new RaisedButton(
              onPressed: () {
                MyToastUtils.showToastInBottom("出现未知错误！", 1);
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: new Center(
                            child: new Text("提示"),
                          ),
                          content: new Text("出现未知错误！"),
                          backgroundColor: Colors.blue,
                        ));
              },
              child: new Text(
                "确认",
                style: new TextStyle(fontFamily: 'familyFontStyle'),
              ),
            ),
            new Center(
              child: new TextField(
                onSubmitted: (String text) {
                  setState(() {
                    if (!isEmail(text)) {
                      _errorStr = 'Error: This is not an email';
                    } else {
                      _errorStr = null;
                    }
                  });
                },
                decoration: new InputDecoration(
                    hintText: "this is a hint", errorText: _errorStr),
              ),
            )
          ]))
        ],
      ),
    );
  }

  _getErrorText() {
    return _errorStr;
  }

  bool isEmail(String em) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(emailRegexp);
    return regExp.hasMatch(em);
  }
}
