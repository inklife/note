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
            alignment: Alignment.topLeft,
            width: 500.0,
            height: 400.0,
            // color: Colors.blue,
            padding: const EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
            margin: const EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
              gradient: const LinearGradient(
                colors: [ Colors.lightBlue, Colors.greenAccent, Colors.yellow ],
              ),
              border: Border.all(width: 2.0, color: Colors.lime)
            ),
          )
        ),
      ),
    );
  }
}
