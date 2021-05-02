// @dart=2.9
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("images/c1.jpg"),
          AssetImage("images/m1.jpeg"),
          AssetImage("images/w4.jpeg"),
          AssetImage("images/w3.jpeg"),
          AssetImage("images/c1.jpg"),
          AssetImage("images/m2.jpg"),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        // centerTitle: true,
        backgroundColor: Colors.red,
        title: Text("FashApp"),
        actions: [
          new IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          new IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: new ListView(
        children: [image_carousel],
      ),
      drawer: myDrawer(),
    );
  }

  Drawer myDrawer() {
    return new Drawer(
      child: ListView(
        children: [
          // Header
          new UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              accountName: Text("Amit Dutta"),
              accountEmail: Text("damitlucky998@gmail.com")),

          // Body
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text("Home Page"),
              leading: Icon(Icons.home),
            ),
          ),

          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text("My Account"),
              leading: Icon(Icons.person),
            ),
          ),

          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text("My Order"),
              leading: Icon(Icons.shopping_basket),
            ),
          ),

          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text("Categoris"),
              leading: Icon(Icons.dashboard),
            ),
          ),

          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text("Favourites"),
              leading: Icon(Icons.favorite),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text("Settings"),
              leading: Icon(
                Icons.settings,
                color: Colors.blue,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
                title: Text("About"),
                leading: Icon(
                  Icons.help,
                  color: Colors.green,
                )),
          ),
        ],
      ),
    );
  }
}
