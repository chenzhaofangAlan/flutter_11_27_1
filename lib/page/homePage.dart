import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  static final String sName = "home";

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    Widget body = new Center(
      child: Text('Flutter')
    );

    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
          icon: new Icon(Icons.access_alarm),
          title: new Text('Alarm'),
          backgroundColor: Colors.deepPurple[500],
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.save),
          title: new Text('Save'),
          backgroundColor: Colors.deepOrange[500],
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.cloud),
          title: new Text('Cloud'),
          backgroundColor: Colors.teal[500],
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.favorite),
          title: new Text('Favorites'),
          backgroundColor: Colors.indigo[500],
        )
      ],
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
    return new Scaffold(
      bottomNavigationBar: botNavBar,
      appBar: new AppBar(
        title: new Text('abc'),
        //leading: new Icon(Icons.home), 不设置这个属性，则 Drawer 会自动显示一个图标
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.add_alarm),
              tooltip: 'Add Alarm',
              onPressed: () {
                // do nothing
              }),
          new PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                new PopupMenuItem<String>(
                    value: "price", child: new Text('Sort by price')),
                new PopupMenuItem<String>(
                    value: "time", child: new Text('Sort by time')),
              ],
              onSelected: (String action) {
                switch (action) {
                  case "price":
                  // do nothing
                    break;
                  case "time":
                  // do nothing
                    break;
                }
              })
        ],
      ),
      body: body,
    );
  }
}