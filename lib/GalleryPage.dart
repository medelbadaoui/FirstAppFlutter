import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'CustomDrawer.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  void replacespace(String s) {
    for (int i = 0; i < s.length; i++)
      if (s.substring(i, (i + 1)) == ' ') s = replaceCharAt(s, i, '+');
  }

  Future<Map> getPics(String key) async {
    replacespace(key);
    String url =
        'https://pixabay.com/api/?key=15597993-c07809e8352135b4cce935710&q=' +
            key +
            '&image_type=photo&pretty=true';
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  String searchkey;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: SafeArea(
        child: customDrawer(context, 3),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Gallery'),
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
                  controller: myController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Tap anything'),
                ),
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    searchkey = myController.text;
                  });
                },
                icon: Icon(Icons.search),
                label: Text('Image'),
                backgroundColor: Colors.teal,
              )
            ],
          ),
          FutureBuilder(
            future: getPics(searchkey),
            builder: (context, snapshot) {
              Map data = snapshot.data;
              if (snapshot.hasError) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                if (snapshot.data['totalHits'] != 0 && data.length != null)
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
                                          title: Text(
                                            '${data['hits'][index]['tags']}',
                                            style:
                                                TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                    '${data['hits'][index]['webformatURL']}'),
                              )
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
  }
}
