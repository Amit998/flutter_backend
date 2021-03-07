import 'package:corona_virus_app/app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EndPointCard extends StatelessWidget {
  final EndPoint endPoint;
  final int value;

  const EndPointCard({Key key, this.endPoint, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Cases", style: Theme.of(context).textTheme.headline4),
                Icon(FontAwesomeIcons.addressCard)
              ],
            ),
            Text(
              value != null ? value.toString() : ' ',
              style: TextStyle(fontSize: 32),
            )
          ],
        ),
      ),
    );
  }
}
