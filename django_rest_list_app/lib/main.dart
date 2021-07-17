import 'dart:convert';

import 'package:django_rest_list_app/note.dart';
import 'package:django_rest_list_app/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Client client = http.Client();
  List<Note> notes = [];

  void _addNote() {}

  @override
  void initState() {
    _retriveNotes();
    super.initState();
  }

  void _retriveNotes() async {
    print('object');
    notes = [];

    var response =
        await client.get(Uri.parse('http://192.168.0.67:8000/notes/'));
    print(response.toString());
    // var jsonData = json.decode(response.body);

    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Django App"),
      ),
      body: Column(
        children: [Text("Note 1")],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _retriveNotes();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
