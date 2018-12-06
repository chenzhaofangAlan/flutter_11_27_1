import 'package:dio/dio.dart';

class Api {
  static const String BaseUrl = "http://jiri1.api.sljy.com/api/";

}


class Network {
  static const String GET = "get";
  static const String POST = "post";

  //get请求
  static void get(String url, {Map<String, String> params, Function callBack, Function errorCallBack}) async {
    _request(Api.BaseUrl + url, method: GET, isFormat: false, params: params, callBack: callBack, errorCallBack: errorCallBack);

  }

  //post请求
  static void post(String url, {Map<String, String> params, bool isFormat, Function callBack, Function errorCallBack}) async {
    _request(Api.BaseUrl + url, method: POST, isFormat: isFormat, params: params, callBack: callBack, errorCallBack: errorCallBack);
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

    try {
      Response response;
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
        response = await Dio().get(url);
      } else {
        if (params != null && params.isNotEmpty) {
          if (isFormat) {
            FormData form = new FormData.from(params);
            response = await Dio().post(url, data: form);
          } else {
            response = await Dio().post(url, data: params);
          }
        } else {
          response = await Dio().post(url);
        }
      }

      print(response);
      statusCode = response.statusCode;
      print(response.statusCode);

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
      _handError(errorCallBack, exception.toString());
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