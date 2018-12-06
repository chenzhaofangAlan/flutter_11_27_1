import 'package:flutter/material.dart';

class MyInputWidget extends StatefulWidget {
  final bool obscureText;

  final String hintText;

  final Icon icon;

  final ValueChanged<String> onChanged;

  final TextStyle textStyle;

  final TextEditingController controller;

  MyInputWidget({Key key, this.hintText, this.icon, this.onChanged, this.textStyle, this.controller, this.obscureText = false}) : super(key: key);

  @override
  _MyInputWidgetState createState() => new _MyInputWidgetState();
}

class _MyInputWidgetState extends State<MyInputWidget> {

  _MyInputWidgetState() : super();

  @override
  Widget build(BuildContext context) {
    return new TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      decoration: new InputDecoration(
        hintText: widget.hintText,
        icon: widget.icon,
      ),
    );
  }
}