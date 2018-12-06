import 'package:flutter/material.dart';
import 'package:flutter_11_27_1/widget/MyFlexButton.dart';
import 'package:flutter_11_27_1/widget/MyInputWidget.dart';
import 'package:flutter_11_27_1/page/homePage.dart';
import 'dart:convert';
import 'package:flutter_11_27_1/common/NetWork.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_11_27_1/widget/loginPageWidget.dart';

class loginPage extends StatefulWidget {
  @override
  loginPageState createState() => new loginPageState();
}

class loginPageState extends State<loginPage> {
  static final String sName = "login";

  final TextEditingController userController = new TextEditingController();
  final TextEditingController pwController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // TODO: implement build
    return loginPageWidget(
      onPress: loginBtnClick,
      pwController: pwController,
      userController: userController,
    );
  }

  loginBtnClick () async {
    Map<String, String> requestParams = {
      "phone": userController.text,
      "password": pwController.text
    };
    Network.post('user/login', params: requestParams, isFormat: true, callBack: (data) {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) {
            return new MyHomePage();
          })
      );
//      Navigator.pushNamed(context, '/homePage');
      print('data'+data);

    }, errorCallBack: (error) {
      print('error'+error);
    });
  }
}
