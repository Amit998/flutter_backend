import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:store_app/const/colors.dart';
import 'package:store_app/provider/dark_theme_provider.dart';

class CartFull extends StatefulWidget {
  const CartFull({Key key}) : super(key: key);

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      height: 140,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Theme.of(context).backgroundColor),
      child: Row(
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZHVjdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                    fit: BoxFit.fill)),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Title",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {},
                            child: Container(
                                height: 50,
                                width: 50,
                                child: Icon(
                                  Entypo.cross,
                                  color: Colors.red,
                                ))),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Price"),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "  45\$",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text("Sub Total:"),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "  45\$",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: themeChange.darkTheme
                                ? Colors.brown.shade900
                                : Theme.of(context).accentColor),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Ships Free",
                        style: TextStyle(
                            color: themeChange.darkTheme
                                ? Colors.brown.shade900
                                : Theme.of(context).accentColor),
                      ),
                      Spacer(),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {},
                            child: Container(
                                child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Entypo.minus,
                                color: Colors.red,
                              ),
                            ))),
                      ),
                      Card(
                        elevation: 12,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.08,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  // begin: ,
                                  // end: ,
                                  stops: [
                                0.0,
                                0.7
                              ], colors: [
                            ColorsConsts.gradiendLEnd,
                            ColorsConsts.gradiendLStart,
                          ])),
                          child: Text(
                            '12',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () {},
                            child: Container(
                                child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Icon(
                                Entypo.plus,
                                color: Colors.green,
                              ),
                            ))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
