import 'package:firstassignement/CameraPage.dart';
import 'package:firstassignement/GalleryPage.dart';
import 'package:firstassignement/QuizPage.dart';
import 'package:firstassignement/WeatherPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BarCodePage.dart';
import 'CustomDrawer.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/first',
      routes: <String, WidgetBuilder>{
        '/first': (BuildContext context) => HomePage(),
        '/a': (BuildContext context) => QuizPage(),
        '/b': (BuildContext context) => WeatherPage(),
        '/c': (BuildContext context) => GalleryPage(),
        '/d': (BuildContext context) => BarCodePage(),
        '/e': (BuildContext context) => CameraPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: SafeArea(
        child: customDrawer(context, 0),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Home Page'),
      ),
      body: HomePage(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
