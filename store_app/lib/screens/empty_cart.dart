import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/const/colors.dart';
import 'package:store_app/provider/dark_theme_provider.dart';

class CartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeChange = Provider.of<DarkThemeProvider>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(top: 80),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/emptycart.png"))),
      ),
      Text(
        "Your Cart Is Empty",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textSelectionColor),
      ),
      // Divider(
      //   thickness: 2,

      // ),
      SizedBox(
        height: 30,
      ),
      Text(
        "Looks Like dou did\'t \n add anything to your cart",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: ThemeChange.darkTheme
                ? Theme.of(context).disabledColor
                : ColorsConsts.subTitle),
      ),
      SizedBox(
        height: 30,
      ),
      SizedBox(
        height: 30,
      ),
      Container(
        width: MediaQuery.of(context).size.width  * 0.6,
        child: RaisedButton(
          onPressed: () {},
          color: Colors.red,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.redAccent)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Shop Now".toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30, color: Theme.of(context).textSelectionColor),
            ),
          ),
        ),
      )
    ]);
  }
}
