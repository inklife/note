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
        body: new ListView(
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.ac_unit),
              title: new Text('ac_unit '),
            ),
            new ListTile(
              leading: new Icon(Icons.access_alarm),
              title: new Text('access_alarm '),
            ),
            new ListTile(
              leading: new Icon(Icons.account_balance),
              title: new Text('account_balance '),
            ),
            new Image.network('https://www.baidu.com/img/bd_logo1.png?where=super'),
            new Text(
              'Some datas',
              style: TextStyle(fontSize: 32.0, color: Colors.lightBlue),
            ),
            new Image.network('https://photo.tuchong.com/2311463/f/15113534.jpg'),
          ],
        )
      ),
    );
  }
  
}
