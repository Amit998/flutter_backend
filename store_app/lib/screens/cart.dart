import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:store_app/const/colors.dart';
import 'package:store_app/const/my_icons.dart';
import 'package:store_app/screens/cart_full.dart';
import 'package:store_app/screens/empty_cart.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List products = [];
    return !products.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Cart Items Count"),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(MyAppIcons.trash))
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 40),
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext btx, int index) {
                    return CartFull();
                  }),
            ),
            bottomSheet: checkOutSection(context),
          );
  }

  Widget checkOutSection(BuildContext ctx) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
        color: Colors.grey,
        width: 0.5,
      ))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(stops: [
                      0.0,
                      0.7
                    ], colors: [
                      ColorsConsts.gradiendLEnd,
                      ColorsConsts.gradiendLStart,
                    ])),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Checkout",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(ctx).textSelectionColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              "Total: ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(ctx).textSelectionColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "US \$ 1799",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
