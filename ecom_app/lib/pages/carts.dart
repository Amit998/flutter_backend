import 'package:ecom_app/components/cart_products.dart';
import 'package:ecom_app/main.dart';
import 'package:ecom_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        centerTitle: true,
        backgroundColor: Colors.red,
        title: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new HomePage()));
            },
            child: Text("FashApp")),
        actions: [
          new IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),

      body: CartProducts(),


      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
                child: ListTile(
              title: Text("Total:"),
              subtitle: new Text("\$239"),
            )),
            Expanded(
              child: new MaterialButton(
                onPressed: () {},
                child: new Text(
                  "Check Out",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
