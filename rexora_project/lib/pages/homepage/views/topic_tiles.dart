import 'package:flutter/material.dart';


class TopicTile extends StatelessWidget {
  String topicName, imgUrl;
  Color color;

  TopicTile({
    @required this.topicName,
    @required this.color,
    @required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      // height: 100,
      // width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
      child: Stack(
        children: [
          Container(
              height: 100,
              width: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                  ))),
          // Positioned(bottom: 40, right: 40, child: Text(topicName.toString()))
        ],
      ),
    );
  }
}
