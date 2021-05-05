import 'package:ecom_app/pages/products_details.dart';
import 'package:flutter/material.dart';



class Similer_Products extends StatefulWidget {
  @override
  _Similer_ProductsState createState() => _Similer_ProductsState();
}

class _Similer_ProductsState extends State<Similer_Products> {
  var similer_product_List = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 1200,
      "price": 850,
    },
    {
      "name": "Blazer",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 1200,
      "price": 850,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 1000,
      "price": 950,
    },
    {
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "old_price": 1000,
      "price": 950,
    },
    {
      "name": "Hills",
      "picture": "images/products/hills2.jpeg",
      "old_price": 1000,
      "price": 950,
    },
    {
      "name": "Pants",
      "picture": "images/products/pants2.jpeg",
      "old_price": 1000,
      "price": 950,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: similer_product_List.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similer_Single_Prod(
            product_name: similer_product_List[index]['name'],
            product_price: similer_product_List[index]['price'],
            product_old_price: similer_product_List[index]['old_price'],
            product_picture: similer_product_List[index]['picture'],
          );
        });
  }
}

class Similer_Single_Prod extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_old_price;
  final product_price;

  Similer_Single_Prod(
      {this.product_name,
      this.product_picture,
      this.product_old_price,
      this.product_price});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Hero(
          tag: product_picture,
          child: Material(
            child: InkWell(
              splashColor: Colors.red,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new Product_Details(
                              product_details_name: product_name,
                              product_details_picture: product_picture,
                              product_details_old_price: product_old_price,
                              product_details_price: product_price,
                            )));
              },
              child: GridTile(
                footer: Container(
                    color: Colors.white.withOpacity(0.8),
                    child: new Row(
                      children: [
                        Expanded(
                            child: Text(
                          product_name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                        new Text(
                          "\$${product_price}",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                child: Image.asset(
                  product_picture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
