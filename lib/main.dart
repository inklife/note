import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello, MD App.',
      home: Scaffold(
          appBar: new AppBar(title: new Text('hahha')),
          body: Center(
            child: Container(
              height: 200.0,
              // alignment: Alignment.topLeft,
              child: new MyList(),
            ),
          )),
    );
  }
}

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 180.0,
          color: Colors.lightBlueAccent,
        ),
        Container(
          width: 180.0,
          color: Colors.pink,
        ),
        Container(
          width: 180.0,
          color: Colors.amberAccent,
        ),
        Container(
          width: 180.0,
          color: Colors.greenAccent,
        ),
      ],
    );
  }
}
