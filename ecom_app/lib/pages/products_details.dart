import 'package:flutter/material.dart';

class Product_Details extends StatefulWidget {
  final product_details_name;
  final product_details_picture;
  final product_details_old_price;
  final product_details_price;

  const Product_Details(
      {Key? key,
      this.product_details_name,
      this.product_details_picture,
      this.product_details_old_price,
      this.product_details_price})
      : super(key: key);

  @override
  _Product_DetailsState createState() => _Product_DetailsState();
}

class _Product_DetailsState extends State<Product_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        // centerTitle: true,
        backgroundColor: Colors.red,
        title: Text("FashApp"),
        actions: [
          new IconButton(
              onPressed: () {
                print(widget.product_details_name);
                print(widget.product_details_old_price);
                print(widget.product_details_picture);
                print(widget.product_details_price);
              },
              icon: Icon(Icons.search)),
          new IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: new ListView(
        children: [
          Container(
            color: Colors.white,
            // color: Colors.white.withOpacity(0.4),
            height: 300.0,
            child: Container(
              child: GridTile(
                child: Image.asset(
                  widget.product_details_picture,
                  // fit: BoxFit.fill,
                ),
                footer: new Container(
                  color: Colors.white.withOpacity(0.5),
                  child: ListTile(
                    leading: new Text(
                      widget.product_details_name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    title: new Row(
                      children: [
                        Expanded(
                            child: Text(
                          "\$${widget.product_details_price.toString()}",
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        )),
                        Expanded(
                            child: Text(
                          "\$${widget.product_details_price.toString()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              // First Button
              Expanded(
                  child: MaterialButton(
                elevation: 0.2,
                onPressed: () {},
                child: Row(
                  children: [
                    Expanded(
                        child: new Text(
                      "Size",
                    )),
                    Expanded(child: new Icon(Icons.arrow_drop_down))
                  ],
                ),
                color: Colors.white,
                textColor: Colors.red,
              )),
              // Second Button
              Expanded(
                  child: MaterialButton(
                elevation: 0.2,
                onPressed: () {},
                child: Row(
                  children: [
                    Expanded(
                        child: new Text(
                      "Color",
                    )),
                    Expanded(child: new Icon(Icons.arrow_drop_down))
                  ],
                ),
                color: Colors.white,
                textColor: Colors.red,
              )),
              // Third Button
              Expanded(
                  child: MaterialButton(
                elevation: 0.2,
                onPressed: () {},
                child: Row(
                  children: [
                    Expanded(
                        child: new Text(
                      "Qty",
                    )),
                    Expanded(child: new Icon(Icons.arrow_drop_down))
                  ],
                ),
                color: Colors.white,
                textColor: Colors.red,
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: MaterialButton(
                elevation: 0.2,
                onPressed: () {},
                child: Expanded(
                    child: new Text(
                  "Buy Now",
                )),
                color: Colors.red,
                textColor: Colors.white,
              )),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_shopping_cart),
                color: Colors.red,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
              )
            ],
          )
        ],
      ),
    );
  }
}
