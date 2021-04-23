import 'package:flutter/material.dart';

class PerformerTile extends StatelessWidget {
  String id, imageUrl, name;
  PerformerTile(
      {@required this.id, @required this.imageUrl, @required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: 160,
      // height: 140,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 1),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 10,
            color: Colors.white.withOpacity(0.10))
      ]),
      child: InkWell(
        // onTap: () {},
        // splashColor: Colors.grey,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                "https://images.unsplash.com/photo-1542103749-8ef59b94f47e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
                fit: BoxFit.cover,
              ),
            ),
            // Positioned(
            //   top: 10,
            //   bottom: 10,
            //   right: 10,
            //   left: 10,
            //   child: Center(
            //     child: RaisedButton(
            //       color: Colors.black.withOpacity(0.01),
            //       onPressed: () {},
            //       child: Text("Click"),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
