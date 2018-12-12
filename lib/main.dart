import 'package:flutter/material.dart';
import 'package:flutter_11_27_1/page/loginPage.dart';
import 'package:flutter_11_27_1/common/MyState.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_11_27_1/common/User.dart';

void main() {
  runApp(new FlutterReduxApp());
}


class FlutterReduxApp extends StatelessWidget {
  /// 创建Store，引用 MyYState 中的 appReducer 创建 Reducer
  /// initialState 初始化 State
  final store = new Store<MyState>(
    appReducer,
    initialState: new MyState(
        userInfo: User.empty(),
    ),
  );

  FlutterReduxApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 通过 StoreProvider 应用 store
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        home: loginPage(),
      ),
    );
  }
}





