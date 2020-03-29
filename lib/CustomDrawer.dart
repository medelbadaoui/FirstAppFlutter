import 'package:flutter/material.dart';

Drawer customDrawer(BuildContext context, int index) {
  List<bool> liste = [false, false, false, false, false, false];
  liste[index] = true;

  return Drawer(
    child: ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.teal,
                height: 180,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://scontent.fcmn2-2.fna.fbcdn.net/v/t1.0-9/84861422_2599773673636371_6908018814701535232_n.jpg?_nc_cat=106&_nc_sid=85a577&_nc_oc=AQlihJhZTK9C91_1IjhBKKnmiKoEq7SOnFYQGeBiXo9wT2VqO2wZbPD2Oj13JSD8WzI&_nc_ht=scontent.fcmn2-2.fna&oh=ac36ccd1f363a13e3662c03df090e8a1&oe=5E8F0EE0'),
                    ),
                    Text(
                      "Mohammed El Badaoui",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Pacifico'),
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
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/first');
                },
                selected: liste[0],
                title: Text('Home'),
                leading: Icon(Icons.home)),
            Divider(
              height: 0,
              thickness: 4,
            ),
            ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/a');
                },
                selected: liste[1],
                title: Text('Quiz'),
                leading: Icon(Icons.question_answer)),
            Divider(
              height: 0,
              thickness: 4,
            ),
            ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/b');
                },
                selected: liste[2],
                title: Text('Weather'),
                leading: Icon(Icons.wb_sunny)),
            Divider(
              height: 0,
              thickness: 4,
            ),
            ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/c');
                },
                selected: liste[3],
                title: Text('Gallery'),
                leading: Icon(Icons.image)),
            Divider(
              height: 0,
              thickness: 4,
            ),
            ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/d');
                },
                selected: liste[4],
                title: Text('QR Code Scanner'),
                leading: Icon(Icons.code)),
            Divider(
              height: 0,
              thickness: 4,
            ),
            ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/e');
                },
                selected: liste[5],
                title: Text('Camera'),
                leading: Icon(Icons.camera)),
            Divider(
              height: 0,
              thickness: 4,
            )
          ],
        ))
      ],
    ),
  );
}
