import 'package:corona_virus_app/app/services/api.dart';
import 'package:corona_virus_app/app/services/api_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _accessToken = '';
  int _cases;
  int _deaths;

  void _incrementCounter() async {
    final apiService = APIService(API.sandBox());
    final accessToken = await apiService.getAccessToken();
    final cases = await apiService.getEndpointData(
        accessToken: accessToken, endPoint: EndPoint.cases);

    // final deaths = await apiService.getEndpointData(
    //     accessToken: accessToken, endPoint: EndPoint.deaths);

    setState(() {
      _accessToken = accessToken;
      _cases = cases;
      // _deaths = deaths;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_accessToken',
              style: Theme.of(context).textTheme.headline4,
            ),
            _cases != null
                ? Text(
                    '$_cases',
                    style: Theme.of(context).textTheme.headline4,
                  )
                : Text("Click The Button"),
            // _deaths != null
            //     ? Text(
            //         '$_deaths',
            //         style: Theme.of(context).textTheme.headline4,
            //       )
            //     : Text("Click The Button"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
