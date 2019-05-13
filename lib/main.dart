import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      title: 'Text Widget',
      home: Scaffold(
        body: Center(
          child: Container(
            child: new Text(
              'Hello fe.',
              style: TextStyle(fontSize: 40.0)
            ),
            alignment: Alignment.centerLeft,
            width: 500.0,
            height: 400.0,
            color: Colors.blue,
          )
        ),
      ),
    );
  }
}
