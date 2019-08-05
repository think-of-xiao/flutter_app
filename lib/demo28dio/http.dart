import 'package:dio/dio.dart';
import 'package:flutter_app/demo28dio/app_url_address.dart';

class AppHttp {
  static Future getHttp(String typeText) async {
    try {
      Response response;
      var data = {"name": typeText};
      response = await Dio().get(AppUrlAddress.urlStr, queryParameters: data);
      print(response.toString());
      return response.data;
    } catch (e) {
      return print(e);
    }
  }

  static Future postHttp(String typeText) async {
    try {
      Response response;
      var data = {"name": typeText};
      response = await Dio().post(AppUrlAddress.urlStr, queryParameters: data);
      print(response.toString());
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
