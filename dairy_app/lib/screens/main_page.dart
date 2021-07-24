import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        toolbarHeight: 100,
        elevation: 4,
        title: Row(
          children: [
            Text(
              "Dairy",
              style: TextStyle(fontSize: 40, color: Colors.blueGrey.shade400),
            ),
            Text(
              "Dairy",
              style: TextStyle(fontSize: 40, color: Colors.green.shade400),
            ),
          ],
        ),
      ),
    );
  }
}
