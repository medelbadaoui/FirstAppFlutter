import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:async';

import 'CustomDrawer.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  void replacespace(String s) {
    for (int i = 0; i < s.length; i++)
      if (s.substring(i, (i + 1)) == ' ') s = replaceCharAt(s, i, '+');
  }

  String weatherkey;
  Future<Map> getWeather(String key) async {
    replacespace(key);
    String url = 'http://api.openweathermap.org/data/2.5/forecast?q=' +
        key +
        '&APPID=f6cecc5a80a2436948407b0c6fc45cfe';
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  final myController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: SafeArea(
        child: customDrawer(context, 2),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Weather'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: myController1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'City',
                  ),
                ),
              ),
              FloatingActionButton.extended(
                label: Text('Search'),
                backgroundColor: Colors.teal,
                onPressed: () {
                  setState(() {
                    weatherkey = myController1.text;
                  });
                },
              ),
            ],
          ),
          FutureBuilder(
            future: getWeather(weatherkey),
            builder: (context, snapshot) {
              Map data = snapshot.data;
              if (snapshot.hasError) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                if (data['list'] != null && data.length != null)
                  return Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return new Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      color: Colors.teal,
                                      child: ListTile(
                                        trailing: Text(
                                          '${(data['list'][index]['main']['temp'] - 273.15).round()}' +
                                              '°C',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                          ),
                                        ),
                                        leading: Image.network(
                                            'http://openweathermap.org/img/wn/' +
                                                '${data['list'][index]['weather'][0]['icon']}' +
                                                '@2x.png'),
                                        subtitle: Text(
                                            '${new DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(data['list'][index]['dt'] * 1000000))}' +
                                                ' | ' +
                                                '${data['list'][index]['weather'][0]['main']}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20)),
                                        title: Text(
                                            '${new DateFormat('E dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(data['list'][index]['dt'] * 1000000))}',
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            ],
                          );
                        }),
                  );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'No result ! ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.deepOrange),
                ),
              );
            },
          )
        ],
      ),
    );
    ;
  }
}
