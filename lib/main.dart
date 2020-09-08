import 'package:ChatApp/chat_message.dart';
import 'package:flutter/material.dart';

import 'chat_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Chat App',
      theme: new ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.indigoAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Chat App'),
        ),
        body: new ChatScreen());
  }
}
