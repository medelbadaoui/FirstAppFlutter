import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomDrawer.dart';

class HomePage extends StatelessWidget {
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
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: NetworkImage(
                'https://scontent.fcmn3-2.fna.fbcdn.net/v/t1.0-9/84861422_2599773673636371_6908018814701535232_n.jpg?_nc_cat=106&_nc_sid=85a577&_nc_oc=AQmiLgNG-LyHyT9zZbFQNbf33WVALX9G4ZLoVgJy1WVT7_Bl4OTMH0G6jKLqSdgXq-A&_nc_ht=scontent.fcmn3-2.fna&oh=ba97b51ae93c887b5b70b04655c7c3e1&oe=5E9453A0'),
          ),
          Text(
            'El Badaoui',
            style: TextStyle(
                color: Colors.teal,
                fontSize: 40.0,
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold),
          ),
          Text(
            'FLUTTER DEVELOPER',
            style: TextStyle(
              color: Colors.teal[100],
              fontSize: 20.0,
              fontFamily: 'SourceSansPro',
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Colors.white,
            ),
          ),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  '+212 777 854 144',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
              )),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.teal,
                ),
                title: Text(
                  'Mohammed EL Badaoui',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
              )),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.mail,
                  color: Colors.teal,
                ),
                title: Text(
                  'med.elbadaoui@gmail.com',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'SourceSansPro',
                  ),
                ),
              ))
        ],
      )),
    );
  }
}
