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
            child: new Image.network(
              'https://www.baidu.com/img/bd_logo1.png?where=super',
              color: Colors.greenAccent,
              colorBlendMode: BlendMode.colorDodge,
              repeat: ImageRepeat.noRepeat,
              // fit: BoxFit.scaleDown,
            ),
            width: 300.0,
            height: 200.0,
            color: Colors.lightBlue,
          ),
        ),
      ),
    );
  }
}
