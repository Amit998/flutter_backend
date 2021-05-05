import 'package:ecom_app/components/products.dart';
import 'package:ecom_app/components/similar_products.dart';
import 'package:ecom_app/main.dart';
import 'package:ecom_app/pages/carts.dart';
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
        centerTitle: true,
        backgroundColor: Colors.red,
        title: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new HomePage()));
            },
            child: Text("FashApp")),
        actions: [
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
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (builder) {
                        return new AlertDialog(
                          title: new Text("Size"),
                          content: new Text("Choose The Size"),
                          actions: [
                            new MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: new Text("Close"),
                            )
                          ],
                        );
                      });
                },
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
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (builder) {
                        return new AlertDialog(
                          title: new Text("Color"),
                          content: new Text("Choose The Color"),
                          actions: [
                            new MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: new Text("Close"),
                            )
                          ],
                        );
                      });
                },
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
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (builder) {
                        return new AlertDialog(
                          title: new Text("Qty"),
                          content: new Text("Choose The Quantity"),
                          actions: [
                            new MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: new Text("Close"),
                            )
                          ],
                        );
                      });
                },
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
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    child: MaterialButton(
                  elevation: 0.2,
                  onPressed: () {},
                  child: Container(
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
            ),
          ),
          Divider(),
          new ListTile(
            title: Container(
              padding: EdgeInsets.all(10),
              child: new Text(
                "Product Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Container(
              padding: EdgeInsets.all(10),
              child: new Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose",
                style: TextStyle(color: Colors.black45, fontSize: 16),
                // maxLines: 6,
              ),
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                      child: new Text(
                        "Product Name",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.3,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        widget.product_details_name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox()
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                      child: new Text(
                        "Product Brand",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.3,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Brand X",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox()
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                      child: new Text(
                        "Condition ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.3,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "New",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    // SizedBox()
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: new Text(
                "Similar Prodcuts",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Container(
            height: 320,
            child: Similer_Products(),
          )
        ],
      ),
    );
  }
}
