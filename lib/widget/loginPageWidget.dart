import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class loginPageWidget extends StatefulWidget {
  final TextEditingController userController;
  final TextEditingController pwController;

  final VoidCallback onPress;

  loginPageWidget({Key key, this.userController, this.pwController, this.onPress}): super(key: key);

  loginPageWidgetState createState() => new loginPageWidgetState();
}

class loginPageWidgetState extends State<loginPageWidget> {
  var canClickLogin = false;

  valueChanged () {
    setState(() {
      if (widget.userController.text.length == 11 && widget.pwController.text.length >= 6) {
        canClickLogin = true;
      } else {
        canClickLogin = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(padding: new EdgeInsets.only(top: ScreenUtil.statusBarHeight)),
          new SizedBox(
            child: new FlatButton(
              child: new Image(
                image: AssetImage('images/2.0x/loginBackBtn.png'),
                width: ScreenUtil().setWidth(40),
              ),
              splashColor: Colors.white,
              highlightColor: Colors.white,
              onPressed: () {
                print('123');
              },
              color: Colors.white,
            ),
            height: ScreenUtil().setWidth(80),
            width: ScreenUtil().setWidth(80),
          ),
          new Padding(
            padding: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), ScreenUtil().setWidth(40), 0, 0),
            child: new Text(
              '手机号码登录',
              style: new TextStyle(
                  fontSize: ScreenUtil().setWidth(50),
                  fontFamily: 'PingFangSC-Medium',
                  color: Colors.black87
              ),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), ScreenUtil().setWidth(140), ScreenUtil().setWidth(30), 0),
            child: new Row(
              children: <Widget>[
                new SizedBox(
                  width: ScreenUtil().setWidth(130),
                  child: new Text(
                    '手机号码',
                    style: new TextStyle(
                      fontSize: ScreenUtil().setWidth(30),
                      color: Colors.black87,
                      fontFamily: 'PingFangSC-Regular',
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(left: ScreenUtil().setWidth(60)),
                  child: new SizedBox(
                    width: ScreenUtil().setWidth(60),
                    child: new Text(
                      '+86',
                      style: new TextStyle(
                        fontSize: ScreenUtil().setWidth(30),
                        color: Colors.black54,
                        fontFamily: 'PingFangSC-Medium',
                      ),
                    ),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                ),
                new Expanded(
                  child: new TextField(
                    controller: widget.userController,
                    decoration: new InputDecoration(
                        hintText: '请输入十一位手机号码',
                        border: InputBorder.none
                    ),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      valueChanged();
                    },
                    style: new TextStyle(
                        color: Colors.black87,
                        fontSize: ScreenUtil().setWidth(30)
                    ),
                  ),
                )
              ],
            ),
          ),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
            decoration: new BoxDecoration(
                color: Colors.black12
            ),
            height: 1,
          ),
          new Padding(
            padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), ScreenUtil().setWidth(140), ScreenUtil().setWidth(30), 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: ScreenUtil().setWidth(65),
                  child: Text(
                    '密码',
                    style: new TextStyle(
                      fontSize: ScreenUtil().setWidth(30),
                      color: Colors.black87,
                      fontFamily: 'PingFangSC-Regular',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(205)),
                ),
                Expanded(
                  child: TextField(
                    controller: widget.pwController,
                    decoration: new InputDecoration(
                        hintText: '请输入密码',
                        border: InputBorder.none
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      valueChanged();
                    },
                    style: new TextStyle(
                        color: Colors.black87,
                        fontSize: ScreenUtil().setWidth(30)
                    ),
                  ),
                )
              ],
            ),
          ),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
            decoration: new BoxDecoration(
                color: Colors.black12
            ),
            height: 1,
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30), top: ScreenUtil().setWidth(76)),
            child: SizedBox(
              width: ScreenUtil().setWidth(690),
              height: ScreenUtil().setWidth(86),
              child: FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.yellow[800],
                disabledColor: Colors.yellow[300],
                textColor: Colors.black87,
                disabledTextColor: Colors.black45,
                child: Text('登录'),
                onPressed: canClickLogin ? widget.onPress : null
              ),
            ),
          ),
        ],
      ),
    );
  }
}