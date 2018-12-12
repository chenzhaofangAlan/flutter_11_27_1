import 'package:dio/dio.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_11_27_1/common/MyState.dart';
import 'package:flutter_11_27_1/common/User.dart';

class Api {
  static const String BaseUrl = "http://94.191.0.166:8080/dayby/api/";

}


class Network {
  static const String GET = "get";
  static const String POST = "post";

  //get请求
  static void get(String url, {Map<String, String> params, Function callBack, Function errorCallBack}) async {
    _request(Api.BaseUrl + url, method: GET, isFormat: false, params: params, callBack: callBack, errorCallBack: errorCallBack);

  }

  //post请求
  static void post(String url, {Map<String, String> params, Function callBack, Function errorCallBack}) async {
    _request(Api.BaseUrl + url, method: POST, isFormat: false, params: params, callBack: callBack, errorCallBack: errorCallBack);
  }

  //post请求
  static void postFormat(String url, {Map<String, String> params, Function callBack, Function errorCallBack}) async {
    _request(Api.BaseUrl + url, method: POST, isFormat: true, params: params, callBack: callBack, errorCallBack: errorCallBack);
  }

  //具体的还是要看返回数据的基本结构
  //公共代码部分
  static void _request(String url,
      {String method, bool isFormat,
        Map<String, String> params, Function callBack,
        Function errorCallBack}) async {
    print("<net> url :<" + method + ">" + url);

    if (params != null && params.isNotEmpty) {
      print("<net> params :" + params.toString());
    }

    String errorMsg = "";
    int statusCode;
    var token = '';

    var w = StoreConnector<MyState, User>(
      converter: (store) => store.state.userInfo,
      builder: (context, userInfo) {
        token = userInfo.name;
        print('token' + token);
      },
    );

    try {
      Response response;
      Dio dio = new Dio();
      dio.options.headers = {
        "Content-Type": "application/json",
      };
      if (method == GET) {
        //组合GET请求的参数
        if (params != null && params.isNotEmpty) {
          StringBuffer sb = new StringBuffer("?");
          params.forEach((key, value) {
            sb.write("$key" + "=" + "$value" + "&");
          });
          String paramStr = sb.toString();
          paramStr = paramStr.substring(0, paramStr.length - 1);
          url += paramStr;
        }
        response = await dio.get(url);
      } else {
        if (params != null && params.isNotEmpty) {
          if (isFormat) {
            FormData form = new FormData.from(params);
            response = await dio.post(url, data: form);
          } else {
            response = await dio.post(url, data: params);
          }
        } else {
          response = await dio.post(url);
        }
      }

      print(response);
      statusCode = response.statusCode;

      print(statusCode);

      //处理错误部分
      if (statusCode < 0) {
        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
        _handError(errorCallBack, errorMsg);
        return;
      }

      if (callBack != null) {
        callBack(response.data["data"]);
        print("<net> response data:" + response.data["data"]);
      }
    } catch (exception) {
      print(exception);
    }
  }

  //处理异常
  static void _handError(Function errorCallback, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
    print("<net> errorMsg :" + errorMsg);
  }

}