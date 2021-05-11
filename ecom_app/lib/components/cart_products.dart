import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var products_on_the_cart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "size": "N",
      "color": "Red",
      "quantity": 1,
      "price": 850,
    },
    {
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "size": "7",
      "color": "Black",
      "quantity": 1,
      "price": 550,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: products_on_the_cart.length,
      itemBuilder: (context, index) {
        return Container(
          child: Single_cart_product(
            cart_product_color: products_on_the_cart[index]["color"],
            cart_product_name: products_on_the_cart[index]["name"],
            cart_product_picture: products_on_the_cart[index]["picture"],
            cart_product_quantity: products_on_the_cart[index]["quantity"],
            cart_product_price: products_on_the_cart[index]["price"],
            cart_product_size: products_on_the_cart[index]["size"],
          ),
        );
      },
    );
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_product_name;
  final cart_product_picture;
  final cart_product_price;
  final cart_product_quantity;
  final cart_product_color;
  final cart_product_size;

  const Single_cart_product(
      {this.cart_product_name,
      this.cart_product_picture,
      this.cart_product_price,
      this.cart_product_quantity,
      this.cart_product_color,
      this.cart_product_size});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // Leading Section
        leading: new Image.asset(
          cart_product_picture,
          fit: BoxFit.fill,
          width: 70,
          height: 100,
        ),

        // Title Section
        title: new Text(cart_product_name),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            new Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(6),
                  child: new Text("Size"),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Text(
                    cart_product_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: new Text("Color"),
                ),
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Text(
                    cart_product_color,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "\$  ${cart_product_price}",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ))
          ],
        ),
        trailing: Container(
          height: 70,
          alignment: Alignment.center,
          // margin: const EdgeInsets.only(bottom: 30, right: 10),
          width: 50,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  print("object");
                },
                child: Icon(
                  Icons.arrow_upward,
                  size: 19,
                ),
              ),
              Text(
                cart_product_quantity.toString(),
                style: TextStyle(fontSize: 13),
              ),
              InkWell(
                onTap: () {
                  print("object");
                },
                child: Icon(
                  Icons.arrow_downward,
                  size: 19,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  
}
