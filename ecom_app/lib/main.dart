// @dart=2.9
import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecom_app/components/products.dart';
import 'package:ecom_app/pages/carts.dart';
import 'package:flutter/material.dart';
import 'components/horizontal_listView.dart';

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
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 8.0,
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
          new IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (contex) => Cart()));
              },
              icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: new ListView(
        children: [
          image_carousel,
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: new Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          HorizontalList(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: new Text(
                "Recent Prodcuts",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Container(
            height: 320.0,
            child: Products(),
          )
        ],
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
              leading: Icon(Icons.home, color: Colors.red),
            ),
          ),

          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text("My Account"),
              leading: Icon(Icons.person, color: Colors.red),
            ),
          ),

          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text("My Order"),
              leading: Icon(Icons.shopping_basket, color: Colors.red),
            ),
          ),

          InkWell(
            onTap: () {},
            child: ListTile(
                title: Text("Shopping Cart"),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                )),
          ),

          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text("Favourites"),
              leading: Icon(Icons.favorite, color: Colors.red),
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
