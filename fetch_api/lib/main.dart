import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String stringResponse;
  List listData;
  Map mapResponse;
  List listOfFacts;

  Future fetchDataStringData() async {
    http.Response response;
    response =
        await http.get('https://www.thegrowingdeveloper.org/apiview?id=1');

    if (response.statusCode == 200) {
      print(response);
      setState(() {
        stringResponse = response.body;
      });
    }
    print(response);

    // http
  }

  Future fetchDataListData() async {
    http.Response response;
    response =
        await http.get('https://www.thegrowingdeveloper.org/apiview?id=4');
    print(response);

    if (response.statusCode == 200) {
      // print(response);
      setState(() {
        listData = json.decode(response.body);
      });
    }
    print(listData);

    // http
  }

  Future fetchDataJsonData() async {
    http.Response response;
    response =
        await http.get('https://www.thegrowingdeveloper.org/apiview?id=2');
    print(response);

    if (response.statusCode == 200) {
      // print(response);
      setState(() {
        mapResponse = json.decode(response.body);
        listOfFacts = mapResponse['facts'];
      });
    }
    print(mapResponse);

    // http
  }

  @override
  void initState() {
    // fetchDataStringData();
    fetchDataJsonData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Data from Internet"),
        backgroundColor: Colors.blue[900],
      ),
      body: mapResponse == null
          ? Text("No Data Yet")
          : SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    mapResponse['category'].toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(listOfFacts[index]['title'].toString()),
                              Image.network(listOfFacts[index]['image_url']),
                              Text(listOfFacts[index]['description'].toString())
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: listOfFacts == null ? 0 : listOfFacts.length,
                  )
                ],
              ),
            ),
    );
  }
}
