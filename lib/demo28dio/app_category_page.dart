import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/demo28dio/config.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CategoryPageState();
  }
}

class CategoryPageState extends State<CategoryPage> {
  String showText = '还没有请求数据';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('请求远程数据'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: _getHttpData,
              child: Text('请求数据'),
              textTheme: ButtonTextTheme.normal,
            ),
            Text(showText)
          ],
        ),
      ),
    );
  }

  _getHttpData() {
    print('------开始请求数据');
    requestHttp().then((val) {
      setState(() {
        showText = val['data'].toString();
      });
    });
  }

  Future requestHttp() async {
    try {
      Response response;
      Dio dio = Dio();
      /// 伪造请求头，不然获取不到数据
      dio.options.headers = httpHeaders;
      response =
          await dio.get('https://time.geekbang.org/serv/v1/column/newAll');
      print(response);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
